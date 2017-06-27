class Weapon < ApplicationRecord
  has_many :character_weapons, dependent: :destroy
  has_many :characters, through: :character_weapons
  validates :name, :skill, :range, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :encum, :hp, :rarity, :default_damage, :default_crit, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }

  scope :order_by_rarity, -> { order(rarity: :desc) }
  scope :order_by_price, -> { order(price: :desc) }

  def self.parse_weapons(json_weapon_directory = 'lib/data/Weapons.json')
    file = File.read(Rails.root.join(json_weapon_directory))
    data_hash = JSON.parse(file)
    data_hash["Weapons"]["Weapon"]
  end
end
