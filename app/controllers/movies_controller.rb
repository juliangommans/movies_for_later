class MoviesController < ApplicationController
  before_filter :fetch_movie, except: [:create, :index]

  def create
    @movie = Movies::CreateMovie.call(params) unless params[:vote_count] < 10
  end

  def show;end

  def index
    @movies = Movie.all
  end

  def update

  end

  def destroy
    @movie.destroy
  end

  private

  def fetch_movie
    @movie = Movie.find(params[:id])
  end

end
