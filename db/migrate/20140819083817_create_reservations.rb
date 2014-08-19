class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime      :from_date
      t.datetime      :to_date
      t.timestamps
    end
  end
end
