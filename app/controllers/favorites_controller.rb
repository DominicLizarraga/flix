class FavoritesController < ApplicationController

  before_action :require_signin, :set_movie

  def create
    @movie.favorites.create!(user: current_user)
      # or append to the through association
      # @movie.fans << current_user

    redirect_to @movie
  end

  def destroy
    favorite = current_user.favorites.find_by(params[:id])
    favorite.destroy

    redirect_to @movie
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
