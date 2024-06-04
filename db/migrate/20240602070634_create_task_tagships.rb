class CreateTaskTagships < ActiveRecord::Migration[7.1]
  def change
    create_table :task_tagships do |t|
      t.integer :task_id, null:false
      t.integer :tag_id, null:false

      t.timestamps
    end
  end
end
