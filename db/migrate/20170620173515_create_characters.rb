class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :force_rating
      t.references :user, foreign_key: true
      t.string :emotional_strength
      t.string :emotional_weakness
      t.string :conflict
      t.integer :morality
      t.string :gender
      t.integer :age
      t.string :height
      t.string :build
      t.string :hair
      t.string :eyes
      t.text :notable_features
      t.integer :total_xp
      t.integer :available_xp
      t.integer :soak_value
      t.integer :threshold_wounds
      t.integer :current_wounds
      t.integer :threshold_strain
      t.integer :current_strain
      t.integer :ranged_defense
      t.integer :melee_defense
      t.integer :brawn
      t.integer :agility
      t.integer :intellect
      t.integer :cunning
      t.integer :will_power
      t.integer :presence
      t.integer :credits
      t.text :motivations
      t.string :species

      t.timestamps
    end
  end
end
