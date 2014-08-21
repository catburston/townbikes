# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
if Rails.env == "development" || Rails.env == "test"
  puts "Cleaning DB first ..."
  User.destroy_all
  Bicycle.destroy_all
  Reservation.destroy_all
end

BICYCLES = 50

manufacturers = ['Rivendell', 'Raleigh', 'Peugeot', 'gazelle', 'pedersen']
bicycle_types = ['dutch - ladies', 'bakfiets', 'commuter', 'racer', 'MTB']
sizes = [47, 52, 58, 60, 63, 66, 70]

puts "Creating Users ..."
u = User.create!(first_name: "anna", email: "anna@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "bret", email: "bret@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "cara", email: "cara@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "dora", email: "dora@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "eden", email: "eden@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "fred", email: "fred@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "greg", email: "greg@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "hugh", email: "hugh@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "ivan", email: "ivan@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "jane", email: "jane@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "kara", email: "kara@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "lana", email: "lana@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "mira", email: "mira@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "niam", email: "niam@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")
User.create!(first_name: "owen", email: "owen@example.com", password: "aaaa1234", description: "description", phone_number: "00000000", confirmed_at: "2014-08-18 13:24:45.067996")

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
users = User.all.to_a
bicycles.each do |b|
  Reservation.create!(from_date: Time.now + 2.days, to_date: Time.now + 10.days, bicycle_id: b.id, user_id: users.sample.id)
end

puts "Creating Locations"  # Always create seeds with lat & long & result to not cause API calls!
Location.create!(latitude: 41.400221,  longitude: 2.280371, city: "Barcelona1", street_name: "Carrer de Marina, 200", result: "Carrer de Marina, 200, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id))
Location.create!(latitude: 41.403221,  longitude: 2.280371, city: "Barcelona2", street_name: "Carrer de Marina, 201", result: "Carrer de Marina, 201, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+1))
Location.create!(latitude: 41.400721,  longitude: 2.190371, city: "Barcelona3", street_name: "Carrer de Marina, 202", result: "Carrer de Marina, 202, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+2))
Location.create!(latitude: 41.401221,  longitude: 2.160371, city: "Barcelona4", street_name: "Carrer de Marina, 203", result: "Carrer de Marina, 203, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+3))
Location.create!(latitude: 41.410221,  longitude: 2.175371, city: "Barcelona5", street_name: "Carrer de Marina, 204", result: "Carrer de Marina, 204, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+4))
Location.create!(latitude: 41.400721,  longitude: 2.166371, city: "Barcelona6", street_name: "Carrer de Marina, 205", result: "Carrer de Marina, 205, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+5))
Location.create!(latitude: 41.400321,  longitude: 2.146371, city: "Barcelona7", street_name: "Carrer de Marina, 206", result: "Carrer de Marina, 206, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+6))
Location.create!(latitude: 41.400921,  longitude: 2.180351, city: "Barcelona8", street_name: "Carrer de Marina, 207", result: "Carrer de Marina, 207, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+7))
Location.create!(latitude: 41.400521,  longitude: 2.180341, city: "Barcelona9", street_name: "Carrer de Marina, 208", result: "Carrer de Marina, 208, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+8))
Location.create!(latitude: 41.400261,  longitude: 2.180321, city: "Barcelona10", street_name: "Carrer de Marina, 209", result: "Carrer de Marina, 209, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+9))
Location.create!(latitude: 41.400261,  longitude: 2.180379, city: "Barcelona11", street_name: "Carrer de Marina, 300", result: "Carrer de Marina, 300, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+10))
Location.create!(latitude: 41.400291,  longitude: 2.182371, city: "Barcelona12", street_name: "Carrer de Marina, 301", result: "Carrer de Marina, 301, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+11))
Location.create!(latitude: 41.402221,  longitude: 2.180471, city: "Barcelona13", street_name: "Carrer de Marina, 302", result: "Carrer de Marina, 302, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+12))
Location.create!(latitude: 41.400721,  longitude: 2.180371, city: "Barcelona14", street_name: "Carrer de Marina, 303", result: "Carrer de Marina, 303, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+13))
Location.create!(latitude: 41.400321,  longitude: 2.180871, city: "Barcelona15", street_name: "Carrer de Marina, 304", result: "Carrer de Marina, 304, 5, 08013 Barcelona, Barcelona, Spain", user_id: (u.id+14))
