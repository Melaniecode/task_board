class AddUserIdToTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :user, null: false
  end
end
