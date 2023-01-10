# frozen_string_literal: true

class Airport < ApplicationRecord
  has_many :arriving_flights, foreign_key: 'destination_aiport_id', inverse_of: 'departure_aiport'
  has_many :departing_flights, foreign_key: 'departure_aiport_id', inverse_of: 'destination_aiport'
end
