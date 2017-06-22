class AddColumnsToWeapon < ActiveRecord::Migration[5.1]
  def change
  	add_column :weapons, :default_damage, :integer
  	add_column :weapons, :default_crit, :integer
  end
end
