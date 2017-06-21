class Character < ApplicationRecord
  belongs_to :user

  has_many :skills, dependent: :destroy

  after_create :assign_skills

  

  def assign_skills
  	Skill.parse_skills.each do |skill|
  		skills << Skill.create(name: skill["Name"], 
  								description: skill["Description"]["General"], 
  								difficulty: skill["Description"]["Difficulty"], 
  								characteristic: skill["Characteristic"], 
  								type_of_skill: skill["Type"])
  	end
  end
end