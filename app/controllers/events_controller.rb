class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash.notice = "Event #{@event.name} successfully created!"
      redirect_to @event
    else
      flash.alert = "Event #{@event.name} not successfully created!"
      render :new
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :location, :description)
    end
end
