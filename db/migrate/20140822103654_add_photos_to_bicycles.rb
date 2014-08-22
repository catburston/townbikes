class AddPhotosToBicycles < ActiveRecord::Migration
  def change
    add_column :bicycles, :photo, :string
  end
end
