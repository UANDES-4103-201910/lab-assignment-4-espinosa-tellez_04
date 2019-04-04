class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  before_create do
    event_date = TicketType.where(event: Event).where(id: self.ticket_type).select("event_start_date")
    sbeve = Order.where(id: self.order).select("created_at")
    if !event_date.empty?
      if event_date < Date.today
    	  errors.add(:start_date, "can't add ticket for past event")
      end
      if sbeve < Date.today
          errors.add(:start_date, "can't buy ticket of a finished event")
      end
    end
  end
end
