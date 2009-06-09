class TicketsController < ApplicationController

  def index
    
    @tickets=User.find(session[:id]).find_tickets
    @permission= Permission.find(:first, :conditions => {:user_type_id => session[:type], :view => "index" })
  end

  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(params[:ticket].merge(:status_id => 1,:priority_id => 1,:user_id => session[:id]))
    if @ticket.valid?
        @ticket.save 
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end
    
  end

  def comment
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new(params[:comment])
    @comment.subject = User.find(session[:id]).login
    @comment.body ="sdñaksldklkasldkak"
    if @comment.save
      @ticket.comments << @comment
    end
      redirect_to :action => 'show_ticket', :id =>  @ticket.id
  end

  def show_ticket
    @ticket =Ticket.find(params[:id])
    @comments = Comment.all(:conditions => {:ticket_id => @ticket.id}, :order => "created_at DESC")
    
  end

  def cancel
    Comment.delete_all(:ticket_id => Ticket.find(params[:id]))
    Ticket.delete(params[:id])
    redirect_to :action => 'index'
  end

  def finish
  end

  

end
