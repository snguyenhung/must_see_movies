class AddMovieReferenceToInteracts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interacts, :movies
    add_index :interacts, :movie_id
    change_column_null :interacts, :movie_id, false
  end
end
