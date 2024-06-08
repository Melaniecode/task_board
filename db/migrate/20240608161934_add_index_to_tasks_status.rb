class AddIndexToTasksStatus < ActiveRecord::Migration[7.1]
  def change
    add_index :tasks, [:title, :status, :end_time, :priority, :created_at ], name: "search_index_tasks"
  end
end
