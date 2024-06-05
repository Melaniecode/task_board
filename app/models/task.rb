# frozen_string_literal: true

class Task < ApplicationRecord
  # belongs_to :user
  has_many :tags_tasks, dependent: :destroy
  has_many :tags, through: :tags_tasks

  validates :title, :content, :start_time, :end_time, presence: { message: :blank }
  validates :status, :priority, presence: true
  validate :start_time_before_end_time

  enum status: { pending: 0, in_progress: 1, done: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }

  def start_time_before_end_time
    return unless start_time.present? && end_time.present? && start_time >= end_time

    errors.add(:start_time, '要早於結束時間')
  end
end
