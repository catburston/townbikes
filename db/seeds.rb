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
status = ['pending', 'approved', 'rejected']
images = ['20111112 Bike light bracket 242_resized.jpg', '20120825-Amsterdam-038.png', '20140118-Amsterdam-095.png', '20111112-Bike-light-bracket-242_resized.png', '20120825-Amsterdam-064.png', '20140228-Antwerpen-046.png', '20120204-Rivendells-141_resized.png', '20120825-Amsterdam-121.png', 'IMG_2775.png', '20120211-Eastern-suburbs-ride-029_resized.png', '20120825-Amsterdam-123.png', 'IMG_3251.png', '20120211-Eastern-suburbs-ride-031_resized.png', '20120825-Amsterdam-131.png', '_DSC6749.png', '20120219-Rivendells-012_resized.png', '20130801-Mosel-Valley-014.png', '_DSC6754.png', '20120219-Rivendells-019_resized.png', '20130801-Mosel-Valley-014a.png']

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
  Bicycle.create!(manufacturer: manufacturers.sample, bicycle_type: bicycle_types.sample, size: sizes.sample, daily_cost: 20, user_id: u.id, photo: images.sample)
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
  Reservation.create!(from_date: Time.now + 2.days, to_date: Time.now + 10.days, bicycle_id: b.id, user_id: users.sample.id, status: status.sample)
  Reservation.create!(from_date: Time.now + 20.days, to_date: Time.now + 24.days, bicycle_id: b.id, user_id: users.sample.id, status: status.sample)
end

puts "Creating Locations"  # Always create seeds with lat & long & result to not cause API calls!
Location.create!(latitude: 59.917816, longitude: 10.7494539, city: "Oslo", country: "Norway", street_name: "Slottsplassen 1", result: "Slottsplassen 1, 0010 Oslo, Norway", user_id: (u.id))
Location.create!(latitude: 59.9135781, longitude: 10.7452482, city: "Oslo", country: "Norway", street_name: "Grueners gate 1", result: "Grueners gate 1, 0552 Oslo, Norway", user_id: (u.id+1))
Location.create!(latitude: 59.9105716, longitude: 10.7262615, city: "Oslo", country: "Norway", street_name: "Holmens gate 3", result: "Holmens gate 3, 0250 Oslo, Norway", user_id: (u.id+2))

Location.create!(latitude: 55.6761558, longitude: 12.5385229, city: "Copenhagen", country: "Denmark", street_name: "Jaegersborggade 10", result: "Jaegersborggade 10, 2200 Copenhagen, Denmark", user_id: (u.id+3))
Location.create!(latitude: 55.6876485, longitude: 12.5574056, city: "Copenhagen", country: "Denmark", street_name: "Kastellet 1", result: "Kastellet 1, 2100 Copenhagen, Denmark", user_id: (u.id+4))
Location.create!(latitude: 55.674112, longitude: 12.597563, city: "Copenhagen", country: "Denmark", street_name: "Pusher Street", result: "Pusher Street, 1440 Copenhagen, Denmark", user_id: (u.id+5))

Location.create!(latitude: 41.382271, longitude: 2.175687, city: "Barcelona", country: "Spain", street_name: "Carrer de l'Arc de Sant Ramon del Call, 4", result: "Carrer de l'Arc de Sant Ramon del Call, 4, 08002 Barcelona", user_id: (u.id+6))
Location.create!(latitude: 52.5271218, longitude: 13.3983097, city: "Barcelona", country: "Spain", street_name: "Passatge Sert, 57", result: "Passatge Sert, 57, 08003 Barcelona, Spain", user_id: (u.id+7))

Location.create!(latitude: 52.5207638, longitude: 13.3913145, city: "Berlin", country: "Germany", street_name: "Grosse Hamburger Strasse 42", result: "Grosse Hamburger Strasse 42, 10115 Berlin, Germany", user_id: (u.id+8))
Location.create!(latitude: 52.51862, longitude: 13.376187, city: "Berlin", country: "Germany", street_name: "Platz der Republik 1", result: "Platz der Republik 1, 11011 Berlin, Germany", user_id: (u.id+9))

Location.create!(latitude: -37.753326, longitude: 145.001801, city: "Melbourne", country: "Australia", street_name: "822 High St", result: "822 High St, Thornbury VIC 3071, Melbourne, Australia", user_id: (u.id+10))
Location.create!(latitude: -37.802504, longitude: 144.949549, city: "Melbourne", country: "Australia", street_name: "103-107 Errol St", result: "103-107 Errol St, North Melbourne, VIC 3051, Melbourne, Australia", user_id: (u.id+11))
Location.create!(latitude: -37.754558, longitude: 144.999938, city: "Melbourne", country: "Australia", street_name: "23 Plow St", result: "23 Plow St, Thornbury VIC 3071, Melbourne, Australia", user_id: (u.id+12))

Location.create!(latitude: 52.359998, longitude: 4.885219, city: "Amsterdam", country: "Netherlands", street_name: "Museumstraat 1", result: "Museumstraat 1, 1071 XX Amsterdam, Netherlands", user_id: (u.id+13))
Location.create!(latitude: 52.3751513, longitude: 4.8840898, city: "Amsterdam", country: "Netherlands", street_name: "Herengracht 90", result: "Herengracht 90, 1015 BS Amsterdam, Netherlands", user_id: (u.id+14))
