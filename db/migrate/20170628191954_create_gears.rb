class CreateGears < ActiveRecord::Migration[5.1]
  def change
    create_table :gears do |t|
      t.string :name
      t.integer :encum
      t.integer :price
      t.integer :rarity
      t.string :type

      t.timestamps
    end
  end
end
