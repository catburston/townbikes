class AddPropertiesToBicycle < ActiveRecord::Migration
  def change
    add_column :bicycles, :properties, :hstore
  end
end
