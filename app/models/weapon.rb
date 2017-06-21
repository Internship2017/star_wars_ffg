class Weapon < ApplicationRecord
	has_many :character_weapons, dependent: :destroy
	has_many :characters, through: :character_weapons
end
