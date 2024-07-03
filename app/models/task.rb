# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  has_many :tags_tasks, dependent: :destroy
  has_many :tags, through: :tags_tasks

  validates :title, :content, :start_time, :end_time, presence: { message: :blank }
  validates :status, :priority, presence: true
  validate :start_time_before_end_time

  enum status: { pending: 0, in_progress: 1, done: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }

  def start_time_before_end_time
    return unless start_time.present? && end_time.present? && start_time >= end_time

    errors.add(:start_time, :start_time_before_end_time)
  end
  scope :filter_by_title, ->(title) { where('title ILIKE ?', "%#{title}%") if title.present? }
  scope :filter_by_status, ->(status) { where(status:) }
  scope :filter_by_priority, ->(priority) { where(priority:) }

  scope :filter_by, lambda { |f|
    results = where(nil)
    f.each do |key, value|
      results = results.public_send(:"filter_by_#{key}", value) if value.present?
    end
    results
  }
end
