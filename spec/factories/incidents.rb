# frozen_string_literal: true

FactoryBot.define do
  factory :incident do
    sequence(:title) { |n| "Incident_No_#{n}" }
    description { Faker::Company.bs }
    user
    status { Faker::Number.between(0, 2) }
    pending { Faker::Date.between(20.days.ago, Date.today) }
    group
    category
    attachment { Faker::Color.color_name }
    comment { Faker::Company.bs }
    step { Faker::Number.between(1, 3) }
  end
end
