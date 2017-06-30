class Character < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  belongs_to :career
  has_many :character_weapons, dependent: :destroy
  has_many :weapons, through: :character_weapons
  has_many :skills, dependent: :destroy
  has_many :character_gears, dependent: :destroy
  has_many :gears, through: :character_gears

  GENDERS = ["Other", "Male", "Female", "Not Sure", "Why do you care?", "Either way", "Why is this a field?", "Testing"].freeze

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

  def assign_skills
    JsonSkill.skills.each do |json_skill|
      skills.create(json_skill.attributes)
    end
  end

  def upgrade_skills(skills_names)
    skills.where(name: skills_names).update_all("rank = rank + 1")
  end

  def career_skill?(skill_name)
    career.career_skills.include?(skill_name)
  end

  def increase_rank(skill)
    if career_skill?(skill.name)
      increase_xp(skill.career_skill)
    else
      increase_xp(skill.normal_skill)
     end
  end

  def decrease_rank(skill)
    if career_skill?(skill.name)
      decrease_xp(skill.career_skill)
    else
      descrease_xp(skill.normal_skill)
    end
  end

  def decrease_xp(xp)
    xp -= 5
    increment!(:available_xp, xp)
    decrement!(:total_xp, xp)
    skill.rank.decrement!
  end

  def increase_xp(xp)
    if enough_xp?(skill_xp)
      decrement!(:available_xp, xp)
      increment!(:total_xp, xp)
      skill.rank.increment!
    end
  end

  def enough_xp?(xp_to_decrement)
    (available_xp - xp_to_decrement) >= 0 
  end
end