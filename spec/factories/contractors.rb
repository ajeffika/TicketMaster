# frozen_string_literal: true

FactoryBot.define do
  factory :contractor do
    sequence(:contractor_name) { |n| "contractor-#{n}" }
    address { create(:address) }
  end
end
