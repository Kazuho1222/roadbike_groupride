class LikesController < ApplicationController
  before_action :set_event

  def create
    like = current_user.likes.build(event_id: params[:event_id])
    like.save
    render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(event_id: params[:event_id], user_id: current_user.id)
    like.destroy
    render 'destroy.js.erb'
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
