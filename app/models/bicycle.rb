class Bicycle < ActiveRecord::Base
  # setup hstore
  store_accessor  :properties
  validates       :bicycle_type, presence: true
  validates       :size, presence: true
  validates       :daily_cost, presence: true
end
