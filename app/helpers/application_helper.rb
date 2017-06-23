module ApplicationHelper

  def select_skill_type character, skill_type
  	character.skills.by_skill(skill_type).by_name
  end
end
