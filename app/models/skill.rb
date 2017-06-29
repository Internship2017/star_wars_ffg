class Skill < ApplicationRecord
  belongs_to :character

  validates :name, :characteristic, :type_of_skill, presence: true

  validates :description, :difficulty, presence: { allow_blank: true }

  validates :rank,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def self.parse_skills
    file = File.read(Rails.root.join('lib', 'data', 'Skills.json'))
    data_hash = JSON.parse(file)
    data_hash["Skills"]["Skill"]
  end

  scope :by_name, -> { order(:name) }

  scope :with_skill_type, ->(skill_name) { where(type_of_skill: skill_name) }

  def career_skill
    rank = self.rank.to_i
    (rank+1)*5
  end

  def normal_skill
    rank = self.rank.to_i
    ((rank+1)*5)+5
  end

end