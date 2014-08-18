require 'faker'

FactoryGirl.define do
  factory :bicycle do |b|
    b.manufacturer { Faker::Company.name }
    b.bicycle_type "commuter"
    b.size { Faker::Number.number(2) }
    b.daily_cost { Faker::Number.number(2) }
    b.description { Faker::Lorem.paragraph(2) }
  end
end