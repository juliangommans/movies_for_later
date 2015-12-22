class AddWatchedToUserMovies < ActiveRecord::Migration
  def change
    add_column :user_movies, :watched, :boolean, default: false
  end
end
