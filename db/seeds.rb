# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do

  pw = Faker::Internet.password

  User.create!(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    password: pw,
    password_confirmation: pw,
    confirmed_at: Date.today
  )
end

users = User.all

100.times do

Item.create!(
  name: Faker::Lorem.sentence,
  user: users.sample,
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
