# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = []

@user << User.create!(
  email: 'test@test.com',
  password: 'zaq1@WSX',
  username: FFaker::Internet.user_name,
  first_name: FFaker::Name.name,
  last_name: FFaker::Name.last_name,
  birth_date: DateTime.now,
  role: 1,
  confirmed_at: DateTime.now
)

5.times do
  @user << User.create!(
    email: FFaker::Internet.unique.email,
    password: 'zaq1@WSX',
    username: FFaker::Internet.user_name,
    first_name: FFaker::Name.name,
    last_name: FFaker::Name.last_name,
    birth_date: DateTime.now,
    role: 1,
    confirmed_at: DateTime.now
  )
end

@user_group = []
2.times do
  @user_group << Group.create!(
    name: FFaker::Company.unique.name
  )
end

@address = []
5.times do
  @address << Address.create!(
    country: FFaker::Address.country,
    city: FFaker::Address.city,
    street: FFaker::Address.street_name,
    street_number: FFaker::Address.building_number,
    room: FFaker::Address.secondary_address
  )
end

@contractor = []
5.times do
  @contractor << Contractor.create!(
    contractor_name: FFaker::Company.name,
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
    sla_type: FFaker::Job.title,
    sla_time: FFaker::Time.between(20.days.ago, Date.today)
  )
end

@category = []
5.times do
  @category << Category.create!(
    name: FFaker::Lorem.sentence,
    description: FFaker::Company.bs,
    sla_id: 5
  )
end

@incident = []
5.times do
  @incident << Incident.create!(
    title: FFaker::Lorem.sentence,
    description: FFaker::Company.bs,
    user: @user.sample,
    status: 1,
    group: @user_group.sample,
    category: @category.sample,
    attachment: FFaker::Movie.title,
    comment: FFaker::Company.bs,
    step: 4,
    created_by: Date.today,
    modified_by: Date.today,
  )
end
puts 'created 5 records in every table'
