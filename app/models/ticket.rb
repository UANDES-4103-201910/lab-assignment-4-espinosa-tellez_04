class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  before_save do
    event_date = Event.where(id: TicketType.where(id: self.ticket_type).select("event_id")).select("start_date")
    sbeve = Order.where(id: self.order).select("created_at")
    if !event_date.empty?
      if event_date[0].start_date < Date.today
    	  errors.add(:start_date, "can't add ticket for past event") 
	  throw :abort
      end
      if sbeve[0].created_at > event_date[0].start_date
          errors.add(:start_date, "can't buy ticket of a finished event")
	  throw :abort
      end
    end
  end
end
