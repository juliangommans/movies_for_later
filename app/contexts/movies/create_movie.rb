class Movies::CreateMovie
  attr_reader :decorator

  def self.call(params)
    Movies::CreateMovie.new(params).call
  end

  def initialize(params)
    new_movie = Movie.new
    @decorator = Movies::MovieDecorator.new(new_movie, params)
  end

  def call
    decorator.assign_safe_params
    decorator.assign_release_year
    decorator.assign_genres
    decorator.save!
  end

end
