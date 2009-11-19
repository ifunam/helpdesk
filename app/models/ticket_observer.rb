class TicketObserver < ActiveRecord::Observer

  def after_create(ticket)
    Notifier.deliver_order_request_from_user(ticket)
    User.all.each do |user|
      if user.is_tech?
        Notifier.deliver_notify_techs(ticket,user)
      end
    end
  end

  def after_update(ticket)
     Notifier.deliver_ticket_updated(ticket)
  end
end
