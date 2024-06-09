# frozen_string_literal: true

require 'bcrypt'

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password_digest { BCrypt::Password.create('password') }
    authority { User.authorities.keys.sample }
  end
end
