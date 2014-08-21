class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string      :manufacturere
      t.string      :bicycle_type
      t.integer     :size
      t.integer     :daily_cost
      t.text        :description
      t.timestamps
    end
  end
end
