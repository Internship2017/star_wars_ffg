class CharacterWeaponsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character_weapon, except: [:new, :create]
  before_action :verify_character_weapon, except: [:new, :create]

  def destroy
    @character_weapon.destroy
    redirect_to @character_weapon.character, flash: { notice: "Weapon #{@character_weapon.weapon.name} has been destroyed" }
  end

  def show
    @weapon = @character_weapon.weapon
  end

  def new
    @weapons = weapon_list
    @character = current_character
  end

  def create
    @character_weapon = CharacterWeapon.new
    @character_weapon.new_basic_weapon(current_character, current_weapon)

    if @character_weapon.save
      redirect_to current_character, notice: "Weapon #{@character_weapon.weapon.name} was successfully created."
    else
      render :new, flash: { danger: @character_weapon.errors }
    end
  end

  def edit
    @weapon = @character_weapon.weapon
  end

  def update
    if @character_weapon.update(character_weapon_params)
      redirect_to @character_weapon.character
    else
      render :edit, flash: { danger: @character_weapon.errors }
    end
  end

  private

  def weapon_list
    @weapon_list ||= Weapon.order_by_rarity
  end

  def set_character_weapon
    @character_weapon = CharacterWeapon.find(params[:id])
  end

  def verify_character_weapon
    redirect_to edit_user_registration_path, flash: { danger: "YOU SHALL NOT SEE OTHER'S CHARACTERS" } unless @character_weapon
  end

  def current_character
    @current_character ||= Character.find(params[:character_id])
  end

  def current_weapon
    @current_weapon ||= Weapon.find(params[:weapon_id])
  end

  def character_weapon_params
    params.require(:character_weapon).permit(:damage, :crit, :special)
  end
end
