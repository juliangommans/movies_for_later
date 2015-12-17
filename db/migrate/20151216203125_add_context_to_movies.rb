class AddContextToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :context, :string
  end
end
