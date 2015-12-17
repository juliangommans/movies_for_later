class UserMovies::CreateUserMovie
  attr_reader :decorator

  def self.call(params)
    UserMovies::CreateUserMovie.new(params).call
  end

  def initialize(params)
    user_movie = UserMovie.new
    @decorator = UserMovies::UserMovieDecorator.new(user_movie, params)
  end

  def call
    decorator.assign_safe_params
    decorator.assign_movie_id
    decorator.save!
  end

end
