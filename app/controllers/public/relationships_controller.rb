class Public::RelationshipsController < ApplicationController
  
  def create
    @user = User.find(params[:user_id])
    User.follow(@user)
  end
end
