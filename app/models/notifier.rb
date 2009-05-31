class Notifier < ActionMailer::Base
  

  def order_request_from_user(ticket)
    @subject  =  '[HD]Nueva solicitud de soporte'
    @recipients = User.find(ticket.user_id).email
    @from      = 'noreply@fisica.unam.mx'
    @sent_on  =  Time.now
    
    @body      = {:ticket => ticket}
    @content_type = "text/html"
    
  end
  
  # def order_request_for_admin(ticket)
#     @subject  =  '[HD]Nueva solicitud de soporte'
#     @recipients = User.find(session[:id]).email
#     @from      = 'noreply@fisica.unam.mx'
#     @sent_on  =  Time.now
    
#     @body      = {:ticket => ticket}
#     @content_type ="text/html"
#   end
  
  
  
#   def new_comment(comment)
#     @subject  =  'Notifier#new_comment'
#     @recipients= ''
#     @from      = ''
#     @sent_on   = Time.now
    
#     @body     =  {:comment => comment}
#   end

#   def ticket_finish(ticket)
#     @subject   = '[HD]'
#     @recipients= ''
#     @from      = ''
#     @sent_on   = Time.now
    
#     @body      = {:ticket => ticket}
#   end

#   def ticket_cancel(ticket)
#     @subject   = 'Notifier#ticket_cancel'
#     @recipients= ''
#     @from     =  ''
#     @sent_on =   Time.now
    
#     @body   =   {:ticket => ticket}
#   end

end
