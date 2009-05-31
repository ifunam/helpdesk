require 'integral_mailer'
require 'integral_mailer_server'

class ActionMailer::Base
  unless defined? INTEGRAL_MAILER_SERVER
    INTEGRAL_MAILER_SERVER = IntegralMailerServer.new
  end
end

ActionMailer::Base.send(:include, IntegralMailer)
