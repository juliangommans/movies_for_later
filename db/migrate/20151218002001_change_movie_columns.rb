class ChangeMovieColumns < ActiveRecord::Migration
  def change
    rename_column :movies, :name, :title
    rename_column :movies, :description, :overview
    rename_column :movies, :poster, :poster_path
    rename_column :movies, :backdrop, :backdrop_path
  end
end
