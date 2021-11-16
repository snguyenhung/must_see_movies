class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.datetime :dob
      t.time :name
      t.text :bio
      t.string :image

      t.timestamps
    end
  end
end
