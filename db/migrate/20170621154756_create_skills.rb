class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.text :description
      t.text :difficulty
      t.string :characteristic
      t.string :type_of_skill
      t.references :character, foreign_key: true
      t.integer :rank, default: 0

      t.timestamps
    end
  end
end
