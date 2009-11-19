class TechSupport::TicketsController < TicketsController

 def my_list
    @tickets = Ticket.search_and_paginate({ :user_id => current_user.id }, params[:page])
    session[:search] = { :user_id => current_user.id }
    render 'index'
 end

 def my_tickets
     puts current_user.id
   @tickets = Ticket.search_and_paginate({ :user_incharge_id => current_user.id}, params[:page])
    session[:search] = {:user_incharge_id => current_user.id}
    render 'index'
 end

 def edit
   @ticket=Ticket.find(params[:id])
 end

 def update
   @ticket=Ticket.find params[:id]
   @ticket.body = params[:ticket][:body]+"\n"
   @ticket.category_id = params[:ticket][:category_id]
   @ticket.priority_id = params[:ticket][:priority_id]
   @ticket.status_id = params[:ticket][:status_id]
   @ticket.user_incharge_id = params[:ticket][:user_incharge_id]
   @ticket.user_last_modification_id = current_user.id
   if @ticket.save
     redirect_to tech_support_tickets_url
   else
     puts "no paso nada"
   end
 end

def destroy
   @ticket = Ticket.find params[:id]
   @ticket.delete
   flash[:warning] = 'La solicitud se ha borrado'
   redirect_to tech_support_tickets_url
 end



end

