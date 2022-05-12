class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
    current_user.follow(@user)
    redirect_back fallback_location: root_url
  end

  def destroy
    current_user.unfollow(@user)
    redirect_back fallback_location: root_url
  end

  def followings
    @users = @user.followings
    render 'users/_list'
  end

  def followers
    @users = @user.followers
    render 'users/_list'
  end
  
  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
