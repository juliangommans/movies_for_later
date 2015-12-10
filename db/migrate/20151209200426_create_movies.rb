class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.integer :release_year
      t.string :poster
      t.string :backdrop
      t.integer :api_id
      t.integer :vote_count
      t.decimal :vote_average
      t.timestamps null: false
    end
  end
end
