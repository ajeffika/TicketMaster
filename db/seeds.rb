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
  email: 'admin@test.com',
  password: 'zaq1@WSX',
  username: FFaker::Internet.user_name,
  first_name: FFaker::Name.name,
  last_name: FFaker::Name.last_name,
  birth_date: DateTime.now,
  role: 'admin',
  confirmed_at: DateTime.now
)

@user << User.create!(
  email: 'user@test.com',
  password: 'zaq1@WSX',
  username: FFaker::Internet.user_name,
  first_name: FFaker::Name.name,
  last_name: FFaker::Name.last_name,
  birth_date: DateTime.now,
  role: 'user',
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
    role: 'user',
    confirmed_at: DateTime.now
  )
end

@user_group = []
1.times do
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
    address_id: @address.pluck(:id).sample
  )
end

@group_squad = []
1.times do
  @group_squad << GroupSquad.create!(
    user_id: @user.first.id,
    group_id: @user_group.pluck(:id).sample
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
    sla_id: @sla.pluck(:id).sample,
    is_parent: 'true',
    group_id: @user_group.first.id
  )
end

@subcategory = []
25.times do
  @subcategory << Category.create!(
    name: FFaker::Lorem.sentence,
    description: FFaker::Company.bs,
    sla_id: 5,
    category_id: @category.pluck(:id).sample,
    is_parent: 'false'
  )
end

@incident = []
5.times do
  @incident << Incident.create!(
    title: FFaker::Lorem.sentence,
    number: "#{rand(1..10)}_#{rand(1..10)}_#{rand(1..10)}",
    description: FFaker::Company.bs,
    user_id: @user.pluck(:id).sample,
    status: 1,
    group_id: @user_group.pluck(:id).sample,
    category_id: @category.pluck(:id).sample,
    attachment: FFaker::Movie.title,
    comment: FFaker::Company.bs,
    step: 'fresh',
    # creator: User.first,
    # modifier: User.first,
  )
end
puts 'created 5 records in every table'
