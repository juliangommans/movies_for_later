class Movies::MovieDecorator
  attr_reader :movie, :params
  SAFE_PARAMS = %w(
    vote_count vote_average name description poster backdrop api_id
    )

  def initialize(movie, params)
    @movie = movie
    @params = params
  end

  def assign_safe_params
    movie.attributes = slice_params
  end

  def assign_release_year
    movie.release_year = params[:release_date][0..3].to_i
  end

  def assign_genres
    # movie.genre_ids = params[:genre_ids]
  end

  def save!
    if movie.changed?
      movie.save
    end
  end

  private

  def slice_params
    permit_params.slice(*SAFE_PARAMS)
  end

  def permit_params
    params.require(:movie).permit(:movie, :vote_count, :release_date, :genre_ids, :vote_average, :name, :description, :poster, :backdrop, :api_id)
  end

end
