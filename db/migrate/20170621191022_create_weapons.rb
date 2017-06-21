class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :skill
      t.text :range
      t.integer :encum
      t.integer :hp
      t.integer :price
      t.integer :rarity

      t.timestamps
    end
  end
end
