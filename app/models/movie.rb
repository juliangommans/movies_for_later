class Movie < ActiveRecord::Base
  has_many :genres, through: :movie_genres
  has_many :users, through: :user_movies
  has_many :movie_genres
  has_many :user_movies
end
