class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all( :order => "created_at DESC" ) 
    
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
    end
  end



end
