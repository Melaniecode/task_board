class AddForeignKeysToTaskTagships < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :task_tagships, :tasks
    add_foreign_key :task_tagships, :tags
  end
end
