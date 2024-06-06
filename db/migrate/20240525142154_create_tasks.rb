# frozen_string_literal: true

# Create a data table named tasks to store task information.
class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :status, default: 0, null: false
      t.integer :priority, default: 0, null: false
      t.integer :user_id
      t.index :user_id, name: 'index_tasks_on_user_id'
      t.timestamps
    end
  end
end
