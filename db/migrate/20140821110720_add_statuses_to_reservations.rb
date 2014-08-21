class AddStatusesToReservations < ActiveRecord::Migration
  def change
    add_column  :reservations, :status, :integer
  end
end
