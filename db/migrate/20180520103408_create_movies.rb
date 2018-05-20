class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :synopsis
      t.integer :rating
      t.string :actors
      t.string :director

      t.timestamps
    end
  end
end
