class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @editable = @user == current_user
    @events = Event.order('created_at DESC')
    @events_post = Event.where(user_id: params[:id]).order('created_at DESC')
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, success: 'プロフィールを変更しました。'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end
end
