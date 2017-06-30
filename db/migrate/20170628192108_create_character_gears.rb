class CreateCharacterGears < ActiveRecord::Migration[5.1]
  def change
    create_table :character_gears do |t|
      t.references :character, foreign_key: true
      t.references :gear, foreign_key: true

      t.timestamps
    end
  end
end
