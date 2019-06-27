# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = []
5.times do
  @user << User.create!(
    email: Faker::Internet.unique.email,
    password: 'zaq1@WSX',
    username: Faker::Internet.user_name,
    first_name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(10, 100),
    role: Faker::Number.between(0, 1)
  )
end

@user_group = []
2.times do
  @user_group << Group.create!(
    name: Faker::Company.unique.profession
  )
end

@address = []
5.times do
  @address << Address.create!(
    country: Faker::Address.country,
    city: Faker::Address.city,
    street: Faker::Address.street_name,
    street_number: Faker::Address.building_number,
    room: Faker::Address.secondary_address
  )
end

@contractor = []
5.times do
  @contractor << Contractor.create!(
    contractor_name: Faker::Company.name,
    address: @address.sample
  )
end

@group_squad = []
20.times do
  @group_squad << GroupSquad.create!(
    user: @user.sample,
    group: @user_group.sample
  )
end

@sla = []
5.times do
  @sla << Sla.create!(
    sla_type: Faker::Job.field,
    sla_time: Faker::Date.between(20.days.ago, Date.today)
  )
end

@category = []
5.times do
  @category << Category.create!(
    name: Faker::Lorem.sentence(3),
    description: Faker::Company.bs,
    sla_id: Faker::Number.between(1, 5)
  )
end

@incident = []
5.times do
  @incident << Incident.create!(
    title: Faker::Lorem.sentence(3),
    description: Faker::Company.bs,
    user: @user.sample,
    status: Faker::Number.between(1, 5),
    pending: Faker::Date.between(20.days.ago, Date.today),
    group: @user_group.sample,
    category: @category.sample,
    attachment: Faker::Color.color_name,
    comment: Faker::Company.bs,
    step: Faker::Number.between(1, 5)
  )
end
puts 'created 5 records in every table'
