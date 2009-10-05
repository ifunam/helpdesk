class Notifier < ActionMailer::Base
  

  def order_request_from_user(ticket)
    @subject  =  '[HD]Nueva solicitud de soporte'
    @recipients = find_user_email(ticket)
    @from      = 'fenix@fisica.unam.mx'
    @sent_on  =  Time.now
    @body      = {:ticket => ticket}
    @content_type = "text/html"
  end

  def requests_met(ticket)
      @subject  =  '[HD]Nueva solicitud de soporte'
      @recipients = find_user_email(ticket)
      @from      = 'fenix@fisica.unam.mx'
      @sent_on  =  Time.now
      @body      = {:ticket => ticket}
      @content_type = "text/html"
  end   
  
 # def order_request_for_admin(ticket)
 #    @subject  =  '[HD]Nueva solicitud de soporte'
 #    @recipients = find_admin(ticket)#User.find(session[:id]).email
 #    @from      = 'noreply@fisica.unam.mx'
 #    @sent_on  =  Time.now
    
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


  
  def find_user_email(ticket)
    User.find(ticket.user_id).email
  end

  def find_admin(ticket)
    user_id=UserCategory.find(:first, :conditions => {:category_id => ticket.category_id}).user_id
    User.find(user_id).email
  end
end
