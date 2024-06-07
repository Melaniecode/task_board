# frozen_string_literal: true

class TagsTask < ApplicationRecord
  belongs_to :task
  belongs_to :tag
end
