class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy, :entry]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :entry]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @events = Event.order('created_at DESC').page(params[:page]).per(10)
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
    @comments = @event.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    return unless @event.available_slots == 0

    redirect_to root_path
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end

  def destroy
    if @event.attendances.present?
      redirect_to event_path
    else
      @event.destroy
      redirect_to root_path
    end
  end

  def entry
    return unless @event.available_slots.positive?

    current_user.attendances.create(event: @event)
    redirect_to root_path, success: 'エントリーが完了しました。'
  end

  def search
    if params[:q]&.dig(:title)
      squished_keywords = params[:q][:title].squish
      params[:q][:title_cont_any] = squished_keywords.split(' ')
    end
    @q = Event.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty? # 'desc'は降順、'asc'は昇順
    @events = @q.result.page(params[:page]).per(10)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :category_id, :meeting_place, :return_place, :distance, :climbing,
                                  :start_time, :end_time, :capacity, :user, { images: [] }).merge(user_id: current_user.id)
  end

  def set_item
    @event = Event.find(params[:id])
  end

  def move_to_index
    return if current_user == @event.user

    redirect_to action: :index
  end
end
