# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { 'zaq1@WSX' }
    password_confirmation { 'zaq1@WSX' }
    sequence(:username) { |n| "user#{n}" }
    first_name { 'Luke' }
    last_name { 'Skywalker' }
    role { :admin }
    confirmed_at { DateTime.zone.now }
  end
end
