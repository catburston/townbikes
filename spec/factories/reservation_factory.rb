require 'faker'

FactoryGirl.define do
  factory :reservation do |r|
    r.from_date Date.new(2014, 10, 3)
    r.to_date Date.new(2014, 10, 5)
    r.bicycle { FactoryGirl.create(:bicycle) }
    r.renter { FactoryGirl.create(:user) }
  end
end