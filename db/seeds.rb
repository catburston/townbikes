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
5.times do
  Reservation.create!(from_date: Time.now + 2.days, to_date: Time.now + 10.days, bicycle_id: bicycles.sample.id, user_id: (u.id+1))
  Reservation.create!(from_date: Time.now + 22.days, to_date: Time.now + 24.days, bicycle_id: bicycles.sample.id, user_id: (u.id+3))
  Reservation.create!(from_date: Time.now + 26.days, to_date: Time.now + 32.days, bicycle_id: bicycles.sample.id, user_id: (u.id+6))
  Reservation.create!(from_date: Time.now + 20.days, to_date: Time.now + 21.days, bicycle_id: bicycles.sample.id, user_id: (u.id+7))
  Reservation.create!(from_date: Time.now + 27.days, to_date: Time.now + 30.days, bicycle_id: bicycles.sample.id, user_id: (u.id+13))
  Reservation.create!(from_date: Time.now + 29.days, to_date: Time.now + 33.days, bicycle_id: bicycles.sample.id, user_id: (u.id+15))
end

puts "Creating Locations"  # Always create seeds with lat & long & result to not cause API calls!
Location.create!(latitude: 41.3830973, longitude: 2.1675154, search: "Barcelona, Spain, Placa dels Angels, 1,", result: "Placa Angels, 1, 08001 Barcelona, Barcelona, Spain", user_id: (u.id+1))
Location.create!(latitude: 41.3788985, longitude: 2.1694266, search: "Barcelona, Spain, Rambla del Raval", result: "Rambla del Raval, 25, 08001 Barcelona, Barcelona, Spain", user_id: (u.id+7))
Location.create!(latitude: 41.379405,  longitude: 2.180371, city: "Barcelona", street_name: "Carrer de Merce, 5", result: "Carrer de la Merce, 5, 08002 Barcelona, Barcelona, Spain", user_id: (u.id+2))
Location.create!(latitude: 41.2371851, longitude: 1.805886, country: "ES", city: "Sitges", result: "Carrer d'Antoni Gaudi, 2-16, 08870 Sitges, Barcelona, Spain", user_id: (u.id+9))
Location.create!(latitude: 51.5073509, longitude: -0.1277583, country: "UK", city: "London", result: "3 Whitehall, London SW1A 2EL, UK", user_id: (u.id+7))
Location.create!(latitude: 49.2568215, longitude: -123.1125015, result: "3200 Yukon Street, Vancouver, BC V5Y 3R9, Canada", user_id: (u.id+2))
Location.create!(latitude: 53.5511779, longitude: 9.964175899999999, search: "DE Hamburg 20359", result: "Rendsburger Strasse 4, 20359 Hamburg, Germany", user_id: (u.id+3))