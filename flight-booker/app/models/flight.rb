# frozen_string_literal: true

class Flight < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_aiport_id'
  belongs_to :destination_airport, class_name: 'Airport', foreign_key: 'destination_aiport_id'
end
