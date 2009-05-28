class TicketObserver < ActiveRecord::Observer
  observe :ticket

  def  after_create(ticket)
    Notifier.deliver_new_ticket(ticket)
  end

end
