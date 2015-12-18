class UserMoviesController < ApplicationController
  respond_to :json
  before_filter :fetch_user_movie, except: [:create, :index]

  def create
    @user_movie = UserMovies::CreateUserMovie.call(params)
  end

  def index
    if current_user.present?
      @user_movies = UserMovie.where(user_id: current_user.id)
    end
  end

  def show;end

  def update;end

  def destroy;end

  private

  def fetch_user_movie
    @user_movie = UserMovie.find(params[:id])
  end

end
