class Character < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  belongs_to :career
  has_many :character_weapons, dependent: :destroy
  has_many :weapons, through: :character_weapons
  has_many :skills, dependent: :destroy

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
    self.skills.where(name: skills_names).update_all("rank = rank + 1")
  end

  def set_rank(skill, status)
    if (self.career_skill?(skill.name))
      if self.enough_xp?(skill.career_skill)
        self.set_xp(skill, skill.career_skill, status)
      end
    else 
      if self.enough_xp?(skill.normal_skill)
        self.set_xp(skill, skill.normal_skill, status)
      end
    end
  end

  def career_skill?(skill_name)
    self.career.career_skills.include?(skill_name)
  end

  def set_xp(skill, xp, operation)
    if operation == "increment"
      self.decrement!(:available_xp, by = xp)
      self.increment!(:total_xp, by = xp)
      skill.increment!(:rank, by = 1)
    else
      self.increment!(:available_xp, by = xp - 5)
      self.decrement!(:total_xp, by = xp - 5)
      skill.decrement!(:rank, by = 1)
    end
  end

  def enough_xp?(xp_to_decrement)
    if (self.available_xp - xp_to_decrement) > 0 
      return true
    else 
      return false
    end
  end
end