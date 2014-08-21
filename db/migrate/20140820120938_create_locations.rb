class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string      :street_name
      t.string      :suburb
      t.integer     :post_code
      t.string      :city
      t.string      :state
      t.string      :country
      t.float       :latitude
      t.float       :longitude
      t.string      :search
      t.string      :result

      t.timestamps
    end
  end
end
