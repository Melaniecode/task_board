class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null:false
      t.text :content
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
