class UserMovies::CreateUserMovie
  attr_reader :decorator

  def self.call
    UserMovies::CreateUserMovie.new(params).call
  end

  def initialize(params)
    new_user_movie = UserMovie.new
    @decorator = UserMovies::UserMovieDecorator.new(new_user_movie, params)
  end

  def call
    decorator.assign_safe_params
    decorator.assign_user_id
    decorator.save!
  end

end
