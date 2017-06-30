class CharacterGearsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_character_gear, only: [:destroy, :show]
  before_action :verify_character_gear, only: [:destroy, :show]

  def show
  	@gear = @character_gear.gear
  end

  def new
  	@gears = Gear.order_by_rarity.order_by_price
  	@character = Character.find(params[:character_id])
  end

  def create
  	character = Character.find(params[:character_id])
  	gear = Gear.find(params[:gear_id])
    @character_gear = CharacterGear.new(character: character, gear: gear)

    if @character_gear.save
      redirect_to character, notice: "Gear #{gear.name} was successfully created."
    else
      render :new, flash: { danger: @character_gear.errors }
    end
  end

  def destroy
    @character_gear.destroy
    redirect_to @character_gear.character, flash: { notice: "Gear #{@character_gear.gear.name} has been destroyed" }
  end

  private

  def set_character_gear
    @character_gear = CharacterGear.find(params[:id])
  end

  def verify_character_gear
    redirect_to edit_user_registration_path, flash: { danger: "YOU SHALL NOT SEE OTHER'S CHARACTERS" } unless @character_gear
  end

end
