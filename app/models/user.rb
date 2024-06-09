# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  has_many :tasks, dependent: :destroy
  has_secure_password
  enum authority: { normal: 0, admin: 1 }
end
