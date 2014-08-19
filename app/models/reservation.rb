class Reservation < ActiveRecord::Base
  has_one :bicycle
  has_one :user

  validates :bicycle, presence: true
  validates :user, presence: true
end
