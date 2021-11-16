class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.datetime :dob
      t.text :name
      t.text :bio
      t.string :image

      t.timestamps
    end
  end
end
