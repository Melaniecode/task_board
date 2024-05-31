# frozen_string_literal: true

# represents tasks in the application.
class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
end
