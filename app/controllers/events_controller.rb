class EventsController < ApplicationController
  def index
    @events = Event.order('created_at DESC')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :category_id, :meeting_place, :return_place, :distance, :climbing, :start_time, :end_time, :capacity, :user, {images: []}).merge(user_id: current_user.id)
  end

end
