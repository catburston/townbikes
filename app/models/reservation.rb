class Reservation < ActiveRecord::Base
  belongs_to :bicycle
  belongs_to :user

  validates :bicycle_id, presence: true
  validates :user_id, presence: true
end
