class CreateInteracts < ActiveRecord::Migration[6.0]
  def change
    create_table :interacts do |t|
      t.integer :user_id
      t.integer :rating
      t.text :review
      t.integer :movie_id
      t.string :bookmark

      t.timestamps
    end
  end
end
