require 'faker'

FactoryGirl.define do
  factory :bicycle do |b|
    b.manufacturer { Faker::Company.name }
    b.bicycle_type "commuter"
    b.size { Faker::Number.number(2) }
    b.daily_cost { Faker::Number.number(2) }
    b.properties "ladies"=>"0","helmet"=>"1", "front_basket"=>"1", "rear_basket"=>"0", "trailer"=>"0", "internal_gears"=>"0", "child_seat"=>"0", "kickstand"=>"0", "safety_vest"=>"0", "panniers"=>"0", "rack"=>"0", "fenders"=>"0", "lock"=>"1", "skirt_guard"=>"0", "pump"=>"0", "toolkit"=>"0"
    b.description { Faker::Lorem.paragraph(2) }
    b.user { FactoryGirl.create(:user) }
  end
end
