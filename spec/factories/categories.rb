FactoryBot.define do
  factory :category do
    sequence(:name){ |n| "category-#{n}" }
    description Faker::Company.bs,
    sla {create :sla.pluck(id)}
  end
end
