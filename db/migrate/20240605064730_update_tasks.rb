class UpdateTasks < ActiveRecord::Migration[7.1]
  def up
    add_column :tasks, :status, :integer, default: 0, null: false
    add_column :tasks, :priority, :integer, default: 0, null: false
  end

  def down
    remove_column :tasks, :status
    remove_column :tasks, :priority
  end
end
