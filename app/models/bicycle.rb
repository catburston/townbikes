class Bicycle < ActiveRecord::Base
  # setup hstore
  store_accessor :properties
end
