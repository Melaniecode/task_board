class RenameTaskTagshipsToTagsTasks < ActiveRecord::Migration[7.1]
  def change
    rename_table(:task_tagships, :tags_tasks)
  end
end
