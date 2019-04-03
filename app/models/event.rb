class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types

  validate :start_date_cannot_be_in_the_past, :last_attendance

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "the event can't be today or before")
    end
  end

  def last_attendance
# Latest event hosted at this venue
    events = Event.where(start_date: self.start_date).where(event_venue: self.event_venue)
    if events.length > 0
      errors.add(:start_date, "occupied date for the venue")
    end
    
  end

end
