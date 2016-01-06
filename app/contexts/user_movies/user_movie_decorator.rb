class UserMovies::UserMovieDecorator
  attr_reader :user_movie, :params
  SAFE_PARAMS = %w(
    pre_watch_rating post_watch_rating comment user_id watched
    )

  def initialize(user_movie, params)
    @user_movie = user_movie
    @params = params
  end

  def assign_safe_params
    user_movie.attributes = slice_params
  end

  def assign_movie_id
    if params[:user_movie][:movie_id].present?
      user_movie.movie_id = params[:user_movie][:movie_id]
    else
      user_movie.movie_id = fetch_movie_locally.id
    end
  end

  def watched?
    user_movie.watched = true
  end

  def save!
    if user_movie.changed?
      user_movie.save
    end
  end

  private

  def slice_params
    permit_params.slice(*SAFE_PARAMS)
  end

  def fetch_movie_locally
    Movie.find_by(api_id: params[:user_movie][:api_id])
  end

  def permit_params
    params.require(:user_movie).permit(:id, :watched, :user_movie, :movie_id, :user_id, :pre_watch_rating, :post_watch_rating, :comment, :api_id)
  end

end
