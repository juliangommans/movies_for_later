class Movies::MovieDecorator
  attr_reader :movie, :params
  SAFE_PARAMS = %w(
    first_name last_name description vote_count vote_average
    )

  def initialize(movie, params)
    @movie = movie
    @params = params
  end

  def assign_safe_params
    movie.attributes = slice_params
  end

  def assign_images
    movie.poster = params[:poster_path]
    movie.backdrop = params[:backdrop_path]
  end

  def assign_release_year
    movie.release_year = params[:release_date][0..3].to_i
  end

  def assign_genres
    movie.genre_ids = params[:genre_ids]
  end

  def assign_api_id
    movie.api_id = params[:api_id]
  end

  def save!
    if movie.changed?
      movie.save
    end
  end

end
