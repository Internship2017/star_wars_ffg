module ApplicationHelper

  def select_skill_type character, skill_type
    character.skills.with_skill_type(skill_type).by_name
  end
end
