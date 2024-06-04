# frozen_string_literal: true

# represents tasks in the application.
class Task < ApplicationRecord
  # belongs_to :user
  has_many :task_tagships, dependent: :destroy
  has_many :tags, through: :task_tagships

  validates :title, :content, :start_time, :end_time, presence: true, allow_blank: false
  validate :start_time_before_end_time
  enum status: { pending: 0, in_progress: 1, done: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }

  def start_time_before_end_time
    return unless start_time.present? && end_time.present? && start_time >= end_time

    errors.add(:start_time, '要早於 結束時間')
  end
end
