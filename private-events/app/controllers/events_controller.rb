# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    current_user.events.create(events_params)

    redirect_to root_path
  end

  private

  def events_params
    params.require(:event).permit(:title, :description, :date)
  end
end
