# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :email, presence: { message: I18n.t('errors.messages.blank') },
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: I18n.t('errors.messages.valid_email_address') }
  has_many :tasks, dependent: :destroy
  has_secure_password
  enum authority: { normal: 0, admin: 1 }
end
