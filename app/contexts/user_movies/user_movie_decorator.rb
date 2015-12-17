class UserMovies::UserMovieDecorator
  attr_reader :user_movie, :params
  SAFE_PARAMS = %w(
    pre_watch_rating post_watch_rating movie_id comment
    )

  def initialize(user_movie, params)
    @user_movie = user_movie
    @params = params
  end

  def assign_safe_params
    user_movie.attributes = slice_params
  end

  def assign_user_id
    if current_user.present?
      user_movie.user_id = current_user.id
    end
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

  def permit_params
    params.require(:user_movie).permit(:movie_id, :user_id, :pre_watch_rating, :post_watch_rating, :comment)
  end

end
