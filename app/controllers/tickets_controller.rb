class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end
end
