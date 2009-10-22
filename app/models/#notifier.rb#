class Notifier < ActionMailer::Base
  

  def order_request_from_user(ticket)
    @subject  =  '[Soporte Fisica]Nueva solicitud de soporte'
    @recipients = ticket.user.email
    @from      = 'karlos@garden.fisica.unam.mx'
    @sent_on  =  Time.now
    @body      = {:ticket => ticket}
  end

  def ticket_updated(ticket)
    @subject  =  '[Soporte Fisica] Solicitud actualizada'
    @recipients = ticket.user.email
    @from      = 'karlos@garden.fisica.unam.mx'
    @sent_on  =  Time.now
    @body      = {:ticket => ticket}


  end 
  
   def new_comment(comment)
     @subject  =  '[Soporte Fisica] Nuevo comentario'
     @recipients = comment.user.email
     @from      = 'karlos@garden.fisica.unam.mx'
     @sent_on   = Time.now
     @body     =  {:comment => comment}
   end

 

end
