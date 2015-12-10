class Genre < ActiveRecord::Base
  has_many :movies, through: :movie_genres

end
