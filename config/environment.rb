RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

# # Bundler hacks for mod_passenger
# if RAILS_ENV == 'production'
#   Rails::Initializer.module_eval do
#     alias load_environment_without_bundler load_environment
# 
#     def load_environment
#        Bundler.require_env configuration.environment
#        load_environment_without_bundler
#      end
#    end
# end

Rails::Initializer.run do |config|
  config.load_paths += %W( #{RAILS_ROOT}/clients )
  config.time_zone = 'Mexico City'
  config.active_record.observers = :ticket_observer, :comment_observer if RAILS_ENV != 'test'

  config.action_mailer.register_template_extension('haml')
  config.action_mailer.delivery_method = :sendmail
  sendmail_config = YAML.load_file(RAILS_ROOT + "/config/mail.yml")
  config.action_mailer.sendmail_settings = sendmail_config['settings']
end
