# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10000.times do |n|
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               business: Faker::Hacker.say_something_smart)
end

