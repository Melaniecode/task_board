# frozen_string_literal: true

# represents tasks in the application.
class Task < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :content, presence: true
end
