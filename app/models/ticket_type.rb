class TicketType < ApplicationRecord
  belongs_to :event
  belongs_to :ticket_zone

  validates :price, format: { with: /[0-9]+/ }
end
