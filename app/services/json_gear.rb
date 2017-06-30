class JsonGear
  attr_reader :name, :gear_type, :encum, :price, :rarity

  def initialize(attr_gears)
    @attr_gears = attr_gears
  end

  def name
    @attr_gears["Name"]
  end

  def gear_type
    @attr_gears["Type"]
  end

  def encum
    @attr_gears["Encumbrance"]
  end

  def price
    @attr_gears["Price"]
  end

  def rarity
    @attr_gears["Rarity"]
  end

  def self.gears
    Gear.parse_gears.map { |weapon| JsonGear.new(weapon) }
  end

  def attributes
    {
      name: name,
      gear_type: gear_type,
      encum: encum,
      price: price,
      rarity: rarity
    }
  end
end
