class CharacterController < ApplicationController

  def new
    @character = Character.new

  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character, notice: 'Mentor was successfully created.'
    else
      render :new
    end
  end


  private

  def character_params
    params.require(:character).permit(:name, :force_rating)
  end

end


