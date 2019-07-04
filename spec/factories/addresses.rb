# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    sequence(:country) { |n| "country-#{n}" }
    city { 'a_city' }
    street { 'a_street' }
    street_number { 'a_street_number' }
    room { 'a_room' }
  end
end
