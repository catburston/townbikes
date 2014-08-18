class AddHstore < ActiveRecord::Migration
  def change
    def up
      enable_extension :hstore
    end

    def down
      disable_extension :hstore
    end
  end
end
