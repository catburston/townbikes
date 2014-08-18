require 'faker'

FactoryGirl.define do
  factory :user do |u|
    u.first_name { Faker::Name.first_name }
    u.last_name { Faker::Name.last_name }
    u.location { Faker::Address.street_address }
    u.description { Faker::Lorem.paragraph(2) }
    u.password { Faker::Internet.password(8) }
    u.phone_number { Faker::PhoneNumber.phone_number }
    u.email { Faker::Internet.safe_email }
  end
end