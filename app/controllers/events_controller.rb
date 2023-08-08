class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit]

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

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :category_id, :meeting_place, :return_place, :distance, :climbing,
                                  :start_time, :end_time, :capacity, :user, { images: [] }).merge(user_id: current_user.id)
  end
end
