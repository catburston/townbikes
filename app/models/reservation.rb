class Reservation < ActiveRecord::Base
  belongs_to :bicycle
  belongs_to :user
  has_one     :location, through: :user

  validates :bicycle_id, presence: true
  validates :user_id, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true

end
