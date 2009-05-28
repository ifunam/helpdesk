class Notifier < ActionMailer::Base
  

  def new_ticket(ticket)
    @subject  =  '[HD]Nueva solicitud de soporte'
    @recipients = 'protozoario9@hotmail.com'
    @from      = 'protozoario9@hotmail.com'
    @sent_on  =  Time.now
    
    @body      = {:ticket => ticket}
    @content_type ="text/html"

  end

  def new_comment(comment)
    @subject  =  'Notifier#new_comment'
    @recipients= ''
    @from      = ''
    @sent_on   = Time.now
    
    @body     =  {:comment => comment}
  end

  def ticket_finish(ticket)
    @subject   = '[HD]'
    @recipients= ''
    @from      = ''
    @sent_on   = Time.now
    
    @body      = {:ticket => ticket}
  end

  def ticket_cancel(ticket)
    @subject   = 'Notifier#ticket_cancel'
    @recipients= ''
    @from     =  ''
    @sent_on =   Time.now
    
    @body   =   {:ticket => ticket}
  end

end
