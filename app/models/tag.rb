# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :task_tagship, dependent: :destroy
  has_many :tasks, through: :task_tagship

  validates :name, presence: true, uniqueness: true
end
