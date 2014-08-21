require 'faker'

FactoryGirl.define do
  factory :location do |l|
    l.street_name { Faker::Address.street_address }
    l.suburb { Faker::Address.state_abbr }
    l.post_code { Faker::Address.postcode }
    l.state { Faker::Address.state }
    l.country { Faker::Address.country }
    l.latitude { Faker::Address.latitude }
    l.longitude { Faker::Address.longitude }
    l.search { b.street_address + ', ' + b.country }
    l.result { b.street_address + ', ' + b.post_code + ', ' + b.city + ', ' + b.country }
    # l.user_id 1
  end
end
