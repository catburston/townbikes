# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
if Rails.env == "development"
  puts "Cleaning DB first ..."
  User.destroy_all
  Bicycle.destroy_all
end

BICYCLES = 50

manufacturers = ['Rivendell', 'Raleigh', 'Peugeot', 'gazelle', 'pedersen']
bicycle_types = ['dutch - ladies', 'bakfiets', 'commuter', 'racer', 'MTB']
sizes = [47, 52, 58, 60, 63, 66, 70]

puts "Creating users ..."
u = User.create!(first_name: "anna", email: "anna@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Paris", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "bret", email: "bret@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Paris", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "cara", email: "cara@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Berlin", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "dora", email: "dora@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Melbourne", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "eden", email: "eden@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Berlin", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "fred", email: "fred@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Copenhagen", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "greg", email: "greg@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Paris", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "hugh", email: "hugh@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Copenhagen", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "ivan", email: "ivan@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Berlin", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "jane", email: "jane@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Paris", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "kara", email: "kara@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Melbourne", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "lana", email: "lana@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "London", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "mira", email: "mira@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Paris", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "niam", email: "niam@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "London", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "owen", email: "owen@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", location: "Melbourne", confirmed_at: "2014-08-18 13:24:45.067996")

puts "Creating Bicycles ..."
(1..BICYCLES).each do |index|
  Bicycle.create!(manufacturer: manufacturers.sample, bicycle_type: bicycle_types.sample, size: sizes.sample, daily_cost: 20, user_id: u.id)
end

bicycles = Bicycle.all.to_a
User.all.to_a.each do |user, index|
  (1..3).each do
    user.bicycles << bicycles.sample
  end
end

puts "Creating Reservations"
Reservation.create!(from_date: Time.now + 2.days, to_date: Time.now + 10.days, bicycle_id: bicycles.sample.id, user_id: u.id)