class FixMfctrColumnName < ActiveRecord::Migration
  def change
    rename_column :bicycles, :manufacturere, :manufacturer
  end
end
