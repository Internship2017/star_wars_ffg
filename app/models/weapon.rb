class Weapon < ApplicationRecord
	has_many :character_weapons, dependent: :destroy
	has_many :characters, through: :character_weapons

	validates :name, :skill, :range, presence: true

	validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	validates :encum, :hp, :rarity, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }
end
