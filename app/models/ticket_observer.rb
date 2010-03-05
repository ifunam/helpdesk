class TicketObserver < ActiveRecord::Observer

  def after_create(ticket)
    Notifier.deliver_order_request_from_user(ticket)
    ticket.category.users.each do |tech_user| 
      Notifier.deliver_notify_techs(ticket,tech_user)
    end
  end

  def after_update(ticket)
     Notifier.deliver_ticket_updated(ticket)
  end
end
