class CreateSpecies < ActiveRecord::Migration[5.1]
  def change
    create_table :species do |t|
      t.string :name
      t.string :description
      t.integer :source_page
      t.string :source_book
      t.integer :brawn
      t.integer :agility
      t.integer :intellect
      t.integer :cunning
      t.integer :willpower
      t.integer :presence
      t.integer :wound_threshold
      t.integer :strain_threshold
      t.integer :experience
      t.string :skill_name
      t.integer :skill_start_rank
      t.integer :skill_limit_rank

      t.timestamps
    end
  end
end
