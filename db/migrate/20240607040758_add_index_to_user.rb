class AddIndexToUser < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :name, unique: true, name: "index_users_on_name"
  end
end
