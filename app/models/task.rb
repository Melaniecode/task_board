# frozen_string_literal: true

# represents tasks in the application.
class Task < ApplicationRecord
  belongs_to :user
  has_many :task_tagships, dependent: :destroy
  has_many :tags, through: :task_tagship

  validates :title, :content, :start_time, :end_time, presence: true, allow_blank: false
  enum status: { pending: 0, in_progress: 1, done: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }
end
