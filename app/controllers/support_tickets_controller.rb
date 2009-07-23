class SupportTicketsController < ApplicationController
  layout 'support'
  def index
    @tickets=Ticket.all :order => "status_id ASC, created_at ASC"
  end

  def new
    change_status(2,params[:id])
  end
  
  
  def show
    @ticket=Ticket.find(params[:id])
  end

  def destroy
    Ticket.delete(params[:id])
    redirect_to :action => 'index'
  end

  def edit
    change_status(3,params[:id])
  end
  
  def update
    redirect_to :action => 'index'
  end

  private

  def change_status(status_id,ticket_id)
    @ticket=Ticket.find(ticket_id)
    @ticket.status_id = status_id;
    @ticket.save
    respond_to do |format|
      format.js { render 'create.rjs'}
    end
  end
  
end
