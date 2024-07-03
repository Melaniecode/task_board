# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    start_time { Faker::Time.forward(days: 1, period: :morning) }
    end_time { Faker::Time.forward(days: 1, period: :evening) }
    status { Task.statuses.keys.sample }
    priority { Task.priorities.keys.sample }
    user
    trait :with_user do
      user
    end
  end
end
