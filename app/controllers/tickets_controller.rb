class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all(:conditions => {:user_id => session[:id]}, :order => "created_at DESC") 
    session[:id]=User.find(1).id #to do: mover a session_controller
  end

  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(params[:ticket].merge(:status_id => 1,:priority_id => 1,:user_id => session[:id]))
    if @ticket.save 
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end
    
  end

  def create_comment
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new(params[:comment])
    @comment.subject = User.find(session[:id]).login
    if @comment.save
      @ticket.comments << @comment
    end
      redirect_to :action => 'show_ticket', :id =>  @ticket.id
  end

  def show_ticket
    @ticket =Ticket.find(params[:id])
    @comments = @ticket.comments
  end

  def destroy
    Comment.delete_all(:ticket_id => Ticket.find(params[:id]))
    Ticket.delete(params[:id])
    redirect_to :action => 'index'
  end
end
