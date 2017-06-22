class Skill < ApplicationRecord
  belongs_to :character

  validates :name, :description, :difficulty, :characteristic, :type_of_skill, presence: true

  validates :rank,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def self.parse_skills
    file = File.read(Rails.root.join('lib', 'data', 'Skills.json'))
    data_hash = JSON.parse(file)
    data_hash["Skills"]["Skill"]
  end
end