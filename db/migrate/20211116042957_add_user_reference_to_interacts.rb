class AddUserReferenceToInteracts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interacts, :users
    add_index :interacts, :user_id
    change_column_null :interacts, :user_id, false
  end
end
