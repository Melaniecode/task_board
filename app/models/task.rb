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

    errors.add(:start_time, :start_time_before_end_time)
  end
  scope :title_search, ->(title) { where('title ILIKE ?', "%#{title}%") if title.present? }
  scope :status_search, ->(status) { where(status:) if status.present? }

  def self.filter(params)
    title_search(params[:title]).status_search(params[:status])
  end

  def self.create_sample_tasks
    10.times do
      create!(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph,
        start_time: Faker::Time.between(from: DateTime.now - 20, to: DateTime.now),
        end_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 20),
        priority: %w[low medium high].sample,
        status: %w[pending in_progress done].sample
      )
    end
  end
end
