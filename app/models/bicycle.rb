require 'carrierwave/processing/mini_magick'
require 'file_size_validator'

class Bicycle < ActiveRecord::Base
  mount_uploader :photo, BicyclePhotosUploader

  belongs_to  :user #, foreign_key: "user_id", class_name: "User"
  has_many    :reservations
  has_one     :location, through: :user
  # setup hstore
  store_accessor  :properties

  validates       :bicycle_type, presence: true
  validates       :size, presence: true
  validates       :daily_cost, presence: true
  validates       :user_id, presence: true
  validates       :photo, :file_size => { :maximum => 1.megabytes.to_i }

  scope :user_bicycles, -> (bicycle) { where user_id: current_user.id }

end
