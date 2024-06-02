# frozen_string_literal: true

# represents tasks in the application.
class Task < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :content, presence: true

  def self.sorted_tasks(params)
    sort_by = params[:sort_by] || 'id_asc'
    sort_column, sort_direction = sort_by.split
    valid_columns = %w[id created_at]
    valid_directions = %w[asc desc]

    if valid_columns.include?(sort_column) && valid_directions.include?(sort_direction)
      Task.order("#{sort_column} #{sort_direction}")
    else
      Task.order('id asc')
    end
  end
end
