class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @event = Event.find(params[:event_id])
    return unless @comment.save

    CommentChannel.broadcast_to @event, { comment: @comment, user: @comment.user }
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
