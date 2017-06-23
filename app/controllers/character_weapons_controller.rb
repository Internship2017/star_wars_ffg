class CharacterWeaponsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_character_weapon, only: [:destroy, :show]
  before_action :verify_character_weapon, only: [:destroy, :show]

  def destroy
  	weapon_name = @character_weapon.weapon.name
  	@character_weapon.destroy
    redirect_to characters_path, flash: { notice: "Weapon #{weapon_name} has been destroyed" }
  end

  def show
  	@weapon = @character_weapon.weapon
  end

  def new
  	@weapons = Weapon.all.order(rarity: :desc, price: :desc)
  	@character = current_character
  end

  def create
  	@weapon = current_weapon
  	@character_weapon = CharacterWeapon.new(character: current_character, weapon: @weapon, damage: @weapon.default_damage, crit: @weapon.default_crit, special: "Common")
   
    if @character_weapon.save
      redirect_to current_character, notice: 'Weapon was successfully created.'
    else
      render :new, flash: {danger: @character_weapon.errors}
    end
  end

  private
  def set_character_weapon
    @character_weapon = CharacterWeapon.find_by(id: params[:id])
  end

  def verify_character_weapon
    redirect_to edit_user_registration_path, flash: { danger: "YOU SHALL NOT SEE OTHER'S CHARACTERS" } unless @character_weapon
  end

  def current_character
  	Character.find(params[:character_id])
  end

  def current_weapon
  	Weapon.find(params[:weapon_id])
  end
end
