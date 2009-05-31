class TicketObserver < ActiveRecord::Observer
  observe :ticket

  def  after_create(ticket)
    Notifier.deliver_order_request_from_user(ticket)
  end

end
