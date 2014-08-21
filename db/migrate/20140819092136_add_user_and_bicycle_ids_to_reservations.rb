class AddUserAndBicycleIdsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :bicycle_id, :integer
    add_column :reservations, :user_id, :integer
  end
end
