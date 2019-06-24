# frozen_string_literal: true

FactoryBot.define do
  factory :group_squad do
    user { create(:user) }
    group { create(:group) }
  end
end
