class AddIndexes < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :user_id, :integer
    add_index :tags, :name, unique: true
    add_index :task_tagships, :tag_id, name: 'index_task_tagships_on_tag_id'
    add_index :task_tagships, :task_id, name: 'index_task_tagships_on_task_id'
    add_index :tasks, :user_id, name: 'index_tasks_on_user_id'
    add_index :users, :name, unique: true
  end
end
