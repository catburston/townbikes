require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.location { Faker::Address.street_address }
    f.description { Faker::Lorem.paragraph(2) }
    f.password { Faker::Internet.password(8) }
    f.phone_number { Faker::PhoneNumber.phone_number }
    f.email { Faker::Internet.safe_email }
    # f.password "1111"
  end
end