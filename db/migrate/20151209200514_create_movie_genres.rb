class CreateMovieGenres < ActiveRecord::Migration
  def change
    create_table :movie_genres do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :genre, index: true
      t.timestamps null: false
    end
  end
end
