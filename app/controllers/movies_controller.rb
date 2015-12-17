class MoviesController < ApplicationController
  respond_to :json
  before_filter :fetch_movie, except: [:create, :index]

  def create
    if check_validity
      @movie = Movies::CreateMovie.call(params)
    end
  end

  def show;end

  def index
    if params[:context].present?
      @movies = Movie.where(context: 'upcoming')
    else
      if current_user.present?
        @movies = Movie.where()
      else
        @movies = Movie.all
      end
    end
  end

  def update;end

  def destroy
    @movie.destroy
  end

  private

  def check_validity
    if vote_count_check and database_check
      return true
    else
      return false
    end
  end

  def vote_count_check
    if params[:vote_count] < 10 and params[:context] != 'upcoming'
      return false
    else
      return true
    end
  end

  def database_check
    if Movie.find_by(api_id: params[:api_id]).present?
      return false
    else
      return true
    end
  end

  def fetch_movie
    @movie = Movie.find(params[:id])
  end

end
