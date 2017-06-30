class CharactersController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!, except: [:increment_rank, :decrement_rank, :skills_select]
  before_action :set_character, only: [:edit, :update, :show, :destroy]
  before_action :verify_character, only: [:edit, :update, :show, :destroy]

  def skills_select
    career_skills = Career.find_by(name: params[:career]).career_skills
    @skills = Skill.where(name: career_skills)
  end

  def new
    @character = current_user.characters.build
  end

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      @character.assign_skills
      @character.upgrade_skills(params[:character][:skills])
      redirect_to @character, notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  def index
    @characters = current_user.characters
  end

  def edit; end

  def update
    if @character.update(character_params)
      redirect_to characters_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @character.destroy
    redirect_to characters_path, flash: { notice: "Character has been destroyed" }
  end

  def increment_rank
    @character = Character.find(params[:character_id])
    @skill = @character.skills.find_by(name: params[:skill_name])
    @character.increase_rank(@skill)
  end

  def decrement_rank
    @character = Character.find(params[:character_id])
    @skill = @character.skills.find_by(name: params[:skill_name])
    @character.decrease_rank(@skill)
  end

  private

  def set_character
    @character = current_user.characters.find_by(id: params[:id])
  end

  def verify_character
    redirect_to edit_user_registration_path, flash: { danger: "YOU SHALL NOT SEE OTHER'S CHARACTERS" } unless @character
  end

  def character_params
    params.require(:character).permit(:name, :force_rating, :emotional_strength, :emotional_weakness,
                                      :conflict, :morality, :gender, :age, :height, :build, :hair,
                                      :eyes, :notable_features, :total_xp, :available_xp, :soak_value,
                                      :threshold_wounds, :current_wounds, :threshold_strain, :current_strain,
                                      :ranged_defense, :melee_defense, :brawn, :agility, :intellect, :cunning,
                                      :will_power, :presence, :credits, :motivations, :species, :career_id, :campaign_id)
  end
end