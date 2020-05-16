# frozen_string_literal: true

FactoryBot.define do
  factory :incident do
    sequence(:title) { |n| "Incident_No_#{n}" }
    description { FFaker::Company.bs }
    user
    status { FFaker::Number.between(0, 2) }
    pending { FFaker::Date.between(20.days.ago, Date.current) }
    group
    category
    attachment { FFaker::Color.color_name }
    comment { FFaker::Company.bs }
    step { FFaker::Number.between(1, 3) }
    created_by { FFaker::Number.between(1, 4) }
    modified_by { FFaker::Number.between(1, 4) }
  end
end
