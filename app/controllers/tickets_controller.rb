class TicketsController < ApplicationController

  def index
    # @tickets= Ticket.all(:conditions => {:user_id => session[:user_id]})
  end
  
  def show
    @ticket =Ticket.find(params[:id])
    @comments=Comment.find(:all,:conditions => {:parent_id => nil})
  end

  def destroy
    Ticket.delete(params[:id])
    redirect_to :action => 'index'
  end

end
