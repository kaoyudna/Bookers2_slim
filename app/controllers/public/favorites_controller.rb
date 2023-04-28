class Public::FavoritesController < ApplicationController

  def create
    current_user.favorites.new
  end

end

