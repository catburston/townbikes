class Reservation < ActiveRecord::Base
  has_one :bicycle
  has_one :user

  validates :bicycle_id, presence: true
  validates :user_id, presence: true
end
