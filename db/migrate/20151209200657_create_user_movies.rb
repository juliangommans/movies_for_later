class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :user, index: true
      t.integer :pre_watch_rating
      t.integer :post_watch_rating
      t.string :comment

      t.timestamps null: false
    end
  end
end
