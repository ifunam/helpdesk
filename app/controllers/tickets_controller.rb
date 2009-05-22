class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all( :order => "created_at DESC" ) 
    session[:id]=User.find(1).id
  end

  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.status_id = 1
    @ticket.priority_id = 1
    if @ticket.save 
      redirect_to :action => 'index'
    else
      redirect_to :action => 'error'
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
