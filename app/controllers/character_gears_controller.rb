class CharacterGearsController < ApplicationController
	before_action :authenticate_user!

  def show
  end

  def new
  	@gears = Gear.all
  	@character = current_character
  end

  def create
    @character_gear = CharacterGear.new(character: current_character, gear: current_gear)

    if @character_gear.save
      redirect_to current_character, notice: "Gear #{@character_gear.gear.name} was successfully created."
    else
      render :new, flash: { danger: @character_gear.errors }
    end
  end

  private
  def current_character
    @current_character ||= Character.find(params[:character_id])
  end

   def current_gear
    @current_gear ||= Gear.find(params[:gear_id])
  end

end
