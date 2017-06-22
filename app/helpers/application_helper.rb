module ApplicationHelper

  def select_type(skill_type)
    @character.skills.order(:name).select{ |type_skill| type_skill.type_of_skill == skill_type }
  end

end
