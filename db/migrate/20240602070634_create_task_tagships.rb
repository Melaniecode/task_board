class CreateTaskTagships < ActiveRecord::Migration[7.1]
  def change
    create_table :tags_tasks do |t|
      t.belongs_to :task, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tags_tasks, :tag_id, name: 'index_tags_tasks_on_tag_id', if_not_exists: true
    add_index :tags_tasks, :task_id, name: 'index_tags_tasks_on_task_id', if_not_exists: true
  end
end
