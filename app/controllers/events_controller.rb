class EventsController < ApplicationController

  def index
    @events = Event.where("opening_date >= current_date")

    respond_to do |format|
      format.html
      format.json { render :json => @events }
    end

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end

  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :photo, :place, :address, :opening_date, :ending_date, :category, :price, :photo_attachment, :hour)
  end
end
