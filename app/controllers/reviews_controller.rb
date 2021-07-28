class ReviewsController < ApplicationController

  before_action :require_signin
  before_action :set_movie

  def index
    # fail
    @reviews = @movie.reviews
  end
  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to movie_reviews_path(@movie),
        notice: "Thanks for reviewing!"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to movie_reviews_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    @review.destroy
    redirect_to movie_reviews_path(@movie),
        alert: "You deleted the review!"
  end


  private

  def review_params
    params.require(:review).permit(:stars, :comment)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end
