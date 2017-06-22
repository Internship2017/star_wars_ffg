class CharacterWeaponsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_character_weapon, only: [:destroy, :show]
  before_action :verify_character_weapon, only: [:destroy, :show]

  def destroy
  	@character_weapon.destroy
    redirect_to characters_path, flash: { notice: "Character weapon has been destroyed" }
  end

  def show
  	@weapon = @character_weapon.weapon
  end

  private
  def set_character_weapon
    @character_weapon = CharacterWeapon.find_by(id: params[:id])
  end

  def verify_character_weapon
    redirect_to edit_user_registration_path, flash: { danger: "YOU SHALL NOT SEE OTHER'S CHARACTERS" } unless @character_weapon
  end
end
