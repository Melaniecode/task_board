class AddUserIdToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :user
    Task.where(user_id: nil).update_all(user_id: User.first.id)
    change_column_null :tasks, :user_id, false
  end
end
