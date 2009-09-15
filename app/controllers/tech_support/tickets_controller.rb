class TechSupport::TicketsController < TicketsController
  
 def my_list
    @tickets = Ticket.search_and_paginate({ :user_id => current_user.id }, params[:page])
    session[:search] = { :user_id => current_user.id }
    render 'index'
 end

 def my_tickets
   @tickets = Ticket.search_and_paginate({ :category_id => UserCategory.find_by_user_id(current_user.id).category_id}, params[:page])
    session[:search] = {:category_id => UserCategory.find_by_user_id(current_user.id).category_id }
    render 'index'
 end

 def edit
   @ticket=Ticket.find(params[:id])
 end
 
 def update
   @ticket=Ticket.find params[:id]
   @ticket.body = params[:ticket][:body]
   @ticket.category_id = params[:ticket][:category_id]
   @ticket.status_id = params[:ticket][:status_id]
   @ticket.priority_id = params[:ticket][:priority_id]
   if @ticket.save
     redirect_to tech_support_tickets_url
   else
     puts "no paso nada"
   end
 end

 def ticket_comment
   respond_to do |format|
     format.js {render 'ticket_comment', :layout => false}
   end
 end
 
 
end

