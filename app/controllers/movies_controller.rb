class MoviesController < ApplicationController
  respond_to :json
  before_filter :fetch_movie, except: [:create, :index, :refresh_upcoming]

  def create
    if check_validity
      @movie = Movies::CreateMovie.call(params)
    end
  end

  def show;end

  def index
    if params[:context].present?
      @movies = Movie.where(context: 'upcoming').last(20)
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

  def refresh_upcoming
    movies = Movie.where(context: 'upcoming')
    if movies.length > 0
      movies.each do |movie|
        movie.context = ''
        movie.save!
      end
    end

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
    if params[:vote_count] < 1 and params[:context] != 'upcoming'
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
