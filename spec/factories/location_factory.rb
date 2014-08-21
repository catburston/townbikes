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
    # l.search { l.street_address + ', ' + l.country }
    # l.result { l.street_address + ', ' + l.post_code + ', ' + l.city + ', ' + l.country }
    l.user { FactoryGirl.create(:user) }
  end
end
