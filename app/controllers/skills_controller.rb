class SkillsController < ApplicationController
  before_action :authenticate_user!
  def show
    @skill = Skill.find(params[:id])
  end
end