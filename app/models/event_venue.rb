class EventVenue < ApplicationRecord
  validates :name, length: { minimum: 20 }
  validates :capacity, format: { with: /[0-9]+/ }
end
