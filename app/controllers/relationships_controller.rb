class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    redirect_to root_path, success: 'フォローしました'
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to root_path, success: 'フォロー解除しました'
  end
end
