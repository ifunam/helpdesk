class TicketObserver < ActiveRecord::Observer

  def after_create(ticket)
    Notifier.deliver_order_request_from_user(ticket)
  end

  def after_update(ticket)
     Notifier.deliver_ticket_updated(ticket)
  end
end
