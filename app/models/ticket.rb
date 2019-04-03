class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  before_create do
    event_date = Event.where(id: TicketType.where(id: Ticket.where(id: self.ticket_type))).select("start_date")
    sbeve = Order.where(id: self.order).select("created_at")
    if event date < Date.today
    	errors.add(:start_date, "can't add ticket for past event")
    end
    if sbeve < Date.today
        errors.add(:start_date, "can't buy ticket of a finished event")
    end
  end
end
