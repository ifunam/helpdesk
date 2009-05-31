require 'test/unit'
require 'integral_mailer_server'
require 'tempfile'

# always returns a Net::SMTPFatalError on delivery
class IntegralMailerServerSMTPFatalError < IntegralMailerServer
  private
  def do_delivery(host, helo, data, from_email, dest_email)
    raise Net::SMTPFatalError.new("Fatal Error")
  end
end

class IntegralMailerServerSMTPServerBusy < IntegralMailerServer
  private
  def do_delivery(host, helo, data, from_email, dest_email)
    raise Net::SMTPServerBusy.new("Server Busy")
  end
end

class IntegralMailerTest < Test::Unit::TestCase
  def test_server_busy
    temp_log_file = "integral_mailer_test.log"
    File.delete(temp_log_file) if File.exist?(temp_log_file)
    
    @server = IntegralMailerServerSMTPServerBusy.new( {:log_path => temp_log_file} )
    thread = @server.send_mail( "localhost.localdomain",
                                "localhost@localhost.localdomain",
                                ["localhost@localhost.localdomain"],
                                "foo")
    thread.join

    log = ""

    File.open(temp_log_file, 'r') { |f| log =  f.read }
    File.delete(temp_log_file)

    log_lines = log.split("\n")
    assert_equal log_lines.length, 11

    intended_log = "Initializing\nMessage NOT sent to localhost@localhost.localdomain via localhost.localdomain\n  --> Server Busy\n  --> However, I'm not giving up just yet.\nMessage NOT sent to localhost@localhost.localdomain via localhost.localdomain\n  --> Server Busy\n  --> However, I'm not giving up just yet.\nMessage NOT sent to localhost@localhost.localdomain via localhost.localdomain\n  --> Server Busy\n  --> I'm giving up delivery of this message.\n"
    
    log = []; log_lines.each { |l| log << l unless l =~ /^#/ }    
    assert_equal log.join("\n") + "\n", intended_log
  end
  
  def test_fatal_error
    temp_log_file = "integral_mailer_test.log"
    File.delete(temp_log_file) if File.exist?(temp_log_file)
    
    @server = IntegralMailerServerSMTPFatalError.new( {:log_path => temp_log_file} )
    thread = @server.send_mail( "localhost.localdomain",
                                "localhost@localhost.localdomain",
                                ["localhost@localhost.localdomain"],
                                "foo")
    thread.join

    log = ""

    File.open(temp_log_file, 'r') { |f| log =  f.read }
    File.delete(temp_log_file)
    
    log_lines = log.split("\n")
    assert_equal log_lines.length, 5

    intended_log = "Initializing\nMessage NOT sent to localhost@localhost.localdomain via localhost.localdomain\n  --> Fatal Error\n  --> I'm giving up delivery of this message.\n"
    
    log = []; log_lines.each { |l| log << l unless l =~ /^#/ }    
    assert_equal log.join("\n") + "\n", intended_log
  end
end
