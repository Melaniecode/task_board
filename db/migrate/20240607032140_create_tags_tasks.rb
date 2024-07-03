class CreateTagsTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tags_tasks do |t|
      t.belongs_to :task, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
