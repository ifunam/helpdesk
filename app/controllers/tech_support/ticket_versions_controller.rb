class TechSupport::TicketVersionsController < ApplicationController
  before_filter :user_profile

  def show
    @ticket=Ticket.find(params[:id])
  end


end
