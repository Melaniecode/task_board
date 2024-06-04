# frozen_string_literal: true

class TaskTagship < ApplicationRecord
  belongs_to :task
  belongs_to :tag
end
