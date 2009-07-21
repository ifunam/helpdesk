class UserTicketsController < ApplicationController
  def index
    @tickets= Ticket.all :conditions => {:user_id => session[:user_id]} 
  end

  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(params[:ticket].merge(:user_id => session[:user_id]))
    if @ticket.save 
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end
  end

  def show
    @ticket =Ticket.find(params[:id])
    @comments=Comment.find(:all,:conditions => {:parent_id => nil})
    render :partial => 'shared/show', :layout => 'application'
  end
  
end
