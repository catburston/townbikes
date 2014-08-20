class Bicycle < ActiveRecord::Base
  belongs_to  :user
  has_many    :reservations
  has_one     :location, through: :user
  # setup hstore
  store_accessor  :properties

  validates       :bicycle_type, presence: true
  validates       :size, presence: true
  validates       :daily_cost, presence: true
  validates       :user_id, presence: true
  # validates       :location, presence: true
  scope :user_bicycles, -> (bicycle) { where user_id: current_user.id }
end
