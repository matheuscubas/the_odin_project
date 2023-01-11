# frozen_string_literal: true

class FlitghsController < ApplicationController
  def index
    query = query_params
    date = DateTime.parse(query[:departure_time])
    @flights = Flight.where(departure_airport_id: query[:departure_airport_id])
                     .where(destination_airport_id: query[:destination_airport_id])
                     .where(departure_time: date.at_beginning_of_minute..date.at_end_of_minute)
  end

  private

  def query_params
    params.permit(:departure_airport_id, :destination_airport_id, :number_of_seats, :departure_time)
  end
end
