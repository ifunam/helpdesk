class Notifier < ActionMailer::Base

  def order_request_from_user(ticket)
    @subject  =  '[Soporte Fisica]Nueva solicitud de soporte'
    @recipients = ticket.user.email
    @from      = 'soporte@fisica.unam.mx'
    @sent_on  =  Time.now
    @body      = {:ticket => ticket}
  end

  def ticket_updated(ticket)
    @subject  =  '[Soporte Fisica] Solicitud actualizada'
    @recipients = ticket.user.email
    @from      = 'soporte@fisica.unam.mx'
    @sent_on  =  Time.now
    @body      = {:ticket => ticket}
  end

  def notify_techs(ticket,user)
    @subject  =  '[Soporte Fisica]Nueva solicitud de soporte'
    @recipients = user.email
    @from      = 'soporte@fisica.unam.mx'
    @sent_on  =  Time.now
    @body      = {:ticket => ticket}
  end

  def new_comment(user)
    @subject  =  '[Soporte Fisica] Nuevo comentario'
    @recipients = user.email
    @from      = 'soporte@fisica.unam.mx'
    @sent_on   = Time.now
    #@body     =  {:user => user}
  end
end
