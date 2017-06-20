class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character, only: [:edit, :update]
  before_action :verify_character, only: [:edit, :update]

  def edit; end

  def update
    if @character.update(character_params)
      redirect_to edit_user_registration_path
    else
      render :edit
    end
  end

  private

  def set_character
    @character = current_user.characters.find_by(id: params[:id])
  end

  def verify_character
    redirect_to edit_user_registration_path if !@character
  end

  def character_params
    params.require(:character).permit(:name, :force_rating, :emotional_strength, :emotional_weakness, 
                                      :conflict, :morality, :gender, :age, :height, :build, :hair, 
                                      :eyes, :notable_features, :total_xp, :available_xp, :soak_value, 
                                      :threshold_wounds, :current_wounds, :threshold_strain, :current_strain, 
                                      :ranged_defense, :melee_defense, :brawn, :agility, :intellect, :cunning, 
                                      :will_power, :presence, :credits, :motivations, :species)
  end
end
