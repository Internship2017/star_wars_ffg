class Gear < ApplicationRecord
	has_many :character_gears, dependent: :destroy
  has_many :characters, through: :character_gears
  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :encum, :rarity, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }

  scope :order_by_rarity, -> { order(rarity: :desc) }
  scope :order_by_price, -> { order(price: :desc) }

	def self.parse_gears(json_gear_directory = 'lib/data/Gear.json')
    file = File.read(Rails.root.join(json_gear_directory))
    data_hash = JSON.parse(file)
    data_hash["Gears"]["Gear"]
  end
end
