class TicketObserver < ActiveRecord::Observer

  def after_create(ticket)
    Notifier.deliver_order_request_from_user(ticket)
    #User.all.each do |user|
    #  Notifier.deliver_notify_techs(ticket,user) if user.is_tech? and user.category == ticket.category
    #end
    case ticket.category_id
      when 1 then
      Notifier.deliver_notify_techs(ticket,User.find(6))
      Notifier.deliver_notify_techs(ticket,User.find(7))
      when 2 then
      Notifier.deliver_notify_techs(ticket,User.find(2))
      Notifier.deliver_notify_techs(ticket,User.find(3))
      Notifier.deliver_notify_techs(ticket,User.find(5))
      Notifier.deliver_notify_techs(ticket,User.find(10))
      when 3 then
      Notifier.deliver_notify_techs(ticket,User.find(5))
      when 4 then
      Notifier.deliver_notify_techs(ticket,User.find(2))
      Notifier.deliver_notify_techs(ticket,User.find(3))
      Notifier.deliver_notify_techs(ticket,User.find(5))
      Notifier.deliver_notify_techs(ticket,User.find(6))
      Notifier.deliver_notify_techs(ticket,User.find(7))
      Notifier.deliver_notify_techs(ticket,User.find(8))
      Notifier.deliver_notify_techs(ticket,User.find(9))
      Notifier.deliver_notify_techs(ticket,User.find(10))
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 5 then
      Notifier.deliver_notify_techs(ticket,User.find(4))
      Notifier.deliver_notify_techs(ticket,User.find(5))
      Notifier.deliver_notify_techs(ticket,User.find(6))
      Notifier.deliver_notify_techs(ticket,User.find(7))
      Notifier.deliver_notify_techs(ticket,User.find(9))
      Notifier.deliver_notify_techs(ticket,User.find(10))
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 6 then
      Notifier.deliver_notify_techs(ticket,User.find(9))
      Notifier.deliver_notify_techs(ticket,User.find(5))
      when 7 then
      Notifier.deliver_notify_techs(ticket,User.find(4))
      when 8 then
      Notifier.deliver_notify_techs(ticket,User.find(8))
      when 9 then
      Notifier.deliver_notify_techs(ticket,User.find(10))
      when 10 then
      Notifier.deliver_notify_techs(ticket,User.find(10))
      when 11 then
      Notifier.deliver_notify_techs(ticket,User.find(10))
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 12 then
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 13 then
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 14 then
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 15 then
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 16 then
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 17 then
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 18 then
      Notifier.deliver_notify_techs(ticket,User.find(1))
      Notifier.deliver_notify_techs(ticket,User.find(2))
      Notifier.deliver_notify_techs(ticket,User.find(3))
      Notifier.deliver_notify_techs(ticket,User.find(4))
      Notifier.deliver_notify_techs(ticket,User.find(5))
      Notifier.deliver_notify_techs(ticket,User.find(6))
      Notifier.deliver_notify_techs(ticket,User.find(7))
      Notifier.deliver_notify_techs(ticket,User.find(8))
      Notifier.deliver_notify_techs(ticket,User.find(9))
      Notifier.deliver_notify_techs(ticket,User.find(10))
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 19 then
      Notifier.deliver_notify_techs(ticket,User.find(11))
      when 20 then
      Notifier.deliver_notify_techs(ticket,User.find(11))
      end

  end

  def after_update(ticket)
     Notifier.deliver_ticket_updated(ticket)
  end
end
