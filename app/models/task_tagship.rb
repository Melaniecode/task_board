class TaskTagship < ApplicationRecord
  belongs_to :task, null: false, foreign_key: true
  belongs_to :tag, null: false, foreign_key: true
end
