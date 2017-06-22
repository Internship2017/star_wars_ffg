class JsonSkill
  attr_reader :name, :general_description, :difficulty, :characteristic, :type_of_skill

  def initialize(attr_skills)
    @attr_skills = attr_skills
    @description = attr_skills["Description"]
  end

  def name
    @attr_skills["Name"]
  end

  def general_description
    @description["General"]
  end

  def difficulty
    @description["Difficulty"]
  end

  def characteristic
    @attr_skills["Characteristic"]
  end

  def type_of_skill
    @attr_skills["Type"]
  end

  def self.skills
    Skill.parse_skills.map { |skill| JsonSkill.new(skill) }
  end

  def attributes
    {
      name: name, 
      description: general_description,
      difficulty: difficulty,
      characteristic: characteristic,
      type_of_skill: type_of_skill
    }
    
  end
end

