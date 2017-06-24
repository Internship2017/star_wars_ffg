class AddColumnsToWeapon < ActiveRecord::Migration[5.1]
  def change
    add_column :weapons, :default_damage, :integer, default: 1
    add_column :weapons, :default_crit, :integer, default: 1
  end
end
