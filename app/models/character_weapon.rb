class CharacterWeapon < ApplicationRecord
  belongs_to :weapon
  belongs_to :character

  validates :weapon, :character, :special, presence: true

  validates :damage, :crit, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }

  def new_basic_weapon(character, weapon)
    self.character = character
    self.weapon = weapon
    self.damage = weapon.default_damage
    self.crit = weapon.default_crit
  end
end
