class AddUserIdToTasks < ActiveRecord::Migration[7.1]
  def up
    add_reference :tasks, :user
    execute "UPDATE tasks SET user_id = #{User.first.id} WHERE user_id IS NULL;" if User.exists?
    change_column_null :tasks, :user_id, false
  end

  def down
    remove_reference :tasks, :user
  end
end
