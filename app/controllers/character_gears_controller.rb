class CharacterGearsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_character_gear, only: [:destroy]
  before_action :verify_character_gear, only: [:destroy]

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

  def destroy
    @character_gear.destroy
    redirect_to @character_gear.character, flash: { notice: "Gear #{@character_gear.gear.name} has been destroyed" }
  end

  private
  def current_character
    @current_character ||= Character.find(params[:character_id])
  end

   def current_gear
    @current_gear ||= Gear.find(params[:gear_id])
  end

  def set_character_gear
    @character_gear = CharacterGear.find(params[:id])
  end

  def verify_character_gear
    redirect_to edit_user_registration_path, flash: { danger: "YOU SHALL NOT SEE OTHER'S CHARACTERS" } unless @character_gear
  end

end
