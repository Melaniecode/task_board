# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    created_at { Faker::Time.between(from: 1.year.ago, to: Time.zone.now) }
  end
end
