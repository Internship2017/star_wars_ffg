class CharactersController < ApplicationController

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to n@character, notice: 'Mentor was successfully created.'
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :force_rating, :user, :emotional_strength, :emotional_weakness,
                                       :conflict, :morality, :gender, :age, :height, :build, :hair, :eyes,
                                       :notable_features, :total_xp, :available_xp, :soak_value, :threshold_wounds,
                                       :current_wounds, :threshold_strain, :current_strain, :ranged_defense,
                                       :melee_defense, :brawn, :agility, :intellect, :cunning, :will_power,
                                       :presence, :credits, :motivations, :species)
  end

end