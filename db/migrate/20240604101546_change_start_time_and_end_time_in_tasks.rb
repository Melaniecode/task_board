class ChangeStartTimeAndEndTimeInTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :start_time, false
    change_column_null :tasks, :end_time, false
  end
end
