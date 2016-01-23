class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to "success"
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :photo, :place, :address, :opening_date, :ending_date, :category, :price, :photo_attachment, :hour)
  end
end
