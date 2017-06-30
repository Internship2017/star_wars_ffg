class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :gears, :type, :gear_type
  end
end
