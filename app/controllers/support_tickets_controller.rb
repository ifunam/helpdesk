class SupportTicketsController < ApplicationController

  def index
    @tickets=Ticket.all :order => "status_id ASC, created_at ASC"
  end

end
