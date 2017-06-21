class Character < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_many :character_weapons, dependent: :destroy
  has_many :weapons, through: :character_weapons

  validates :name, :species, :motivations, :emotional_strength, :emotional_weakness,
            :notable_features, :gender, :height, :hair, :eyes, :user, :build, :campaign, presence: true

  validates :age, :credits, :total_xp, :available_xp, numericality: { only_integer: true, 
                                                                      greater_than_or_equal_to: 0 }

  validates :brawn, :agility, :intellect, :cunning, :will_power, :presence, :force_rating, 
            numericality: { only_integer: true, greater_than_or_equal_to: 0, 
                            less_than_or_equal_to: 5 }

  validates :threshold_wounds, :conflict, :soak_value, :ranged_defense, :current_wounds, 
            :threshold_strain, :current_strain, :melee_defense, 
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 99 }

  validates :morality, numericality: { only_integer: true, greater_than_or_equal_to: 0,
                                       less_than_or_equal_to: 100 }

end
