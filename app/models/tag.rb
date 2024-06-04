# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :task_tagships, dependent: :destroy
  has_many :tasks, through: :task_tagships

  validates :name, presence: true, uniqueness: true
end
