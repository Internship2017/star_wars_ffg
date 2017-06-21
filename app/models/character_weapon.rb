class CharacterWeapon < ApplicationRecord
  belongs_to :weapon
  belongs_to :character
end
