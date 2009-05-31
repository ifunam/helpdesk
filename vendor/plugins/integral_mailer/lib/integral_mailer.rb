module IntegralMailer
  def perform_delivery_integral_mailer(mail)
    destinations = mail.destinations
    mail.ready_to_send
    
    helo = smtp_settings[:helo] || "localhost.localdomain"
    
    ActionMailer::Base::INTEGRAL_MAILER_SERVER.send_mail(helo, mail.from, destinations, mail.encoded)
  end
end