# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "category-#{n}" }
    description { 'fake_descritpion' }
    sla
  end
end
