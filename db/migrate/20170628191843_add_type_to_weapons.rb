class AddTypeToWeapons < ActiveRecord::Migration[5.1]
  def change
    add_column :weapons, :weapon_type, :string, default: "normal"
  end
end
