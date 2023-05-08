class Public::RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end

  def following
    @user = User.find(params[:user_id])
    @followings = @user.followings
    @book = Book.new
  end

  def follower
    @user = User.find(params[:user_id])
    @followers = @user.followers
    @book = Book.new
  end

end
