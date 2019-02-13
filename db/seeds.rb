# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Attendance.destroy_all
require 'faker'

10.times do
  
  User.create!(email: Faker::Internet.email, password: 'blabla', description: Faker::ChuckNorris.fact, first_name: Faker::FunnyName.name, last_name: Faker::DrWho.catch_phrase)
end

15.times do
  Event.create!(creator: User.all.sample, start_date: Faker::Time.between(DateTime.now, DateTime.now + 1), duration: 5, title: Faker::Movie.quote, description: Faker::Lorem.characters(25), price: Faker::Number.between(1, 1000), location: Faker::Address.city)
end

30.times do
  Attendance.create!(stripe_customer_id: Faker::Lorem.sentence, event: Event.all.sample, user: User.all.sample)
end