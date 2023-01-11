# frozen_string_literal: true

class FlitghsController < ApplicationController
  def index
    @flights = Flight.all
  end

  private

  def query_params
    params.permit(:departure_airport, :destination_airport, :number_of_seats, :departure_time)
  end
end
