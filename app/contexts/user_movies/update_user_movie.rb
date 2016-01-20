class UserMovies::UpdateUserMovie
  attr_reader :decorator

  def self.call(params)
    UserMovies::UpdateUserMovie.new(params).call
  end

  def initialize(params)
    @decorator = UserMovies::UserMovieDecorator.new(UserMovie.find(params[:id]), params)
  end

  def call
    decorator.assign_safe_params
    decorator.assign_movie_id
    decorator.watched?
    decorator.save!
  end

end
