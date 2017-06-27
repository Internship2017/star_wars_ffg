class CreateCharacterWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :character_weapons do |t|
      t.references :weapon, foreign_key: true
      t.references :character, foreign_key: true
      t.integer :damage
      t.integer :crit
      t.text :special, default: "common"

      t.timestamps
    end
  end
end
