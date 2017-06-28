class Gear < ApplicationRecord
	has_many :character_gears, dependent: :destroy
  has_many :characters, through: :character_gears

	def self.parse_gears(json_gear_directory = 'lib/data/Gear.json')
    file = File.read(Rails.root.join(json_gear_directory))
    data_hash = JSON.parse(file)
    data_hash["Gears"]["Gear"]
  end
end
