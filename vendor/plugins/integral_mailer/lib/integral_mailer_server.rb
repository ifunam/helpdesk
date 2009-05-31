require 'net/smtp'
require 'logger'
require 'fileutils'
require 'mx_lookup'

class IntegralMailerServer
  include FileUtils

  def self.reloadable?; false; end
  
  def initialize(opts={})
    @times_to_try_busy_host = opts[:times_to_try_busy_host] || 2
    initialize_log( (opts[:age_log_file] || 'daily'), opts[:log_path] )
  end
  
  def send_mail(helo_domain, from_email, destination_emails, data)
    t = Thread.new do
      destination_emails.each do |dest_email|

        mx_records = MXLookup.for_email(dest_email)
        
        mx_records.each do |mx_record|
          begin
            do_delivery(mx_record[:host], helo_domain, data, from_email, dest_email) and break
          rescue Net::SMTPFatalError => e
            log_fatal_delivery(dest_email, mx_record[:host], e.message) and break
          rescue Net::SMTPServerBusy => e
            log_delayed_delivery(dest_email, mx_record[:host], e.message)
            # there has to be a better method to use for this
            unless (mx_records.find_all { |r| r == mx_record }).size >= @times_to_try_busy_host
              mx_records << mx_record
            else
              log_fatal_delivery(dest_email, mx_record[:host], e.message)
            end
          rescue => e
            if mx_records.last == mx_record
              log_fatal_delivery(dest_email, mx_record[:host], e.message)
            else
              log_delayed_delivery(dest_email, mx_record[:host], e.message)
            end
          end
        end # mx_records.each
        
      end # destination_emails.each
    end # Thread.new 
  end # send_mail
  
  private
  
  def do_delivery(host, helo, data, from_email, dest_email)
    Net::SMTP.start(host, 25, helo) do |smtp|
      smtp.send_message data, from_email, dest_email
      log_successful_delivery(dest_email, host)
    end; true
  end
  
  def log_delayed_delivery(email, host, reason)
    msg =  "Message NOT sent to #{email} via #{host}\n  --> #{reason.strip}\n" +
           "  --> However, I'm not giving up just yet."
    @log.warn(msg); msg
  end
  
  def log_fatal_delivery(email, host, reason)
    msg = "Message NOT sent to #{email} via #{host}\n  --> #{reason.strip}\n" +
          "  --> I'm giving up delivery of this message."
    @log.fatal(msg); msg
  end
  
  def log_successful_delivery(email, host)
    msg = "Message sent to #{email} via #{host}"
    @log.info(msg); msg
  end
  
  def initialize_log(age_log_file='daily', log_path=nil)
    if log_path
      @log = Logger.new(log_path, age_log_file)
    else
      if defined?(RAILS_ROOT)
        @log = Logger.new("#{RAILS_ROOT}/log/integral_mailer.log", age_log_file) rescue Logger.new(STDOUT)
      else
        @log = Logger.new(STDOUT)
      end
    end
    @log.info "Initializing"
  end
end