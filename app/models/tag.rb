class Tag < ApplicationRecord
  has_many :task_tagship
  has_many :tasks, through: :task_tagship

  validates :name, presence: true, uniqueness: true

end
