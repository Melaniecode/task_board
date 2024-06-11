# frozen_string_literal: true

require 'bcrypt'

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    authority { User.authorities.keys.sample }

    after(:build) do |user|
      user.password_digest = BCrypt::Password.create(user.password)
    end
  end
end
