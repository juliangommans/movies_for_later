class Movie < ActiveRecord::Base
  has_many :genres, through: :movie_genres
  has_many :users, through: :user_movies

end
