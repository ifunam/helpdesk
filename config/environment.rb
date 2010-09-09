RAILS_GEM_VERSION = '2.3.9' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.autoload_paths += %W( #{RAILS_ROOT}/clients )
  config.time_zone = 'Mexico City'
  config.active_record.observers = :ticket_observer, :comment_observer if RAILS_ENV != 'test'

  config.action_mailer.register_template_extension('haml')
  config.action_mailer.delivery_method = :sendmail
  sendmail_config = YAML.load_file(RAILS_ROOT + "/config/mail.yml")
  config.action_mailer.sendmail_settings = sendmail_config['settings']
end


ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!({ 
  :default => '%m/%d/%Y %H:%M:%S',  
  :date_time12  => "%m/%d/%Y %I:%M%p", 
  :date_time24  => "%m/%d/%Y %I:%M%p" 
})

