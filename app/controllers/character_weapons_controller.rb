class CharacterWeaponsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character_weapon, only: [:destroy, :show, :edit, :update]
  before_action :verify_character_weapon, only: [:destroy, :show, :edit, :update]

  def destroy
    weapon_name = @character_weapon.weapon.name
    @character_weapon.destroy
    redirect_to @character_weapon.character, flash: { notice: "Weapon #{weapon_name} has been destroyed" }
  end

  def show
    @weapon = @character_weapon.weapon
  end

  def new
    @weapons = Weapon.all.order(rarity: :desc, price: :desc)
    @character = current_character
  end

  def create
    @character_weapon = CharacterWeapon.new(new_character_weapon_params)

    if @character_weapon.save
      redirect_to current_character, notice: 'Weapon was successfully created.'
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

  def set_character_weapon
    @character_weapon = CharacterWeapon.find(params[:id])
  end

  def verify_character_weapon
    redirect_to edit_user_registration_path, flash: { danger: "YOU SHALL NOT SEE OTHER'S CHARACTERS" } unless @character_weapon
  end

  def current_character
    Character.find(params[:character_id])
  end

  def current_weapon
    @current_weapon ||= Weapon.find(params[:weapon_id])
  end

  def new_character_weapon_params
    {
      character: current_character,
      weapon: current_weapon,
      damage: current_weapon.default_damage,
      crit: current_weapon.default_crit,
      special: "Common"
    }
  end

  def character_weapon_params
    params.require(:character_weapon).permit(:damage, :crit, :special)
  end
end
