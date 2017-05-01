# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include Faker

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet::password
  )
end

users = User.all

100.times do
  Item.create!(
    name: Faker::Lorem.sentence,
    user: users.sample
  )
end

items = Item.all

member = User.create!(
  email: 'member@example.com',
  password: 'helloworld'
)

puts "seed finished"
puts "#{User.count} users created"
puts "#{Item.count} wikis created"
