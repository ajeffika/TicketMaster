# frozen_string_literal: true
require 'factory_bot'

10.times do
  FactoryBot.create :user
  FactoryBot.create :group
  FactoryBot.create :address
  FactoryBot.create :contractor
  FactoryBot.create :sla
  FactoryBot.create :category
  FactoryBot.create :incident
end
puts 'created 5 records in every table'
