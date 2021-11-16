class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.text :title
      t.date :year
      t.integer :duration
      t.text :description
      t.string :image
      t.integer :director_id

      t.timestamps
    end
  end
end
