class JsonWeapon
  attr_reader :name, :weapon_type, :skill, :default_damage, :default_crit, :range, :encum, :hp, :price, :rarity

  def initialize(attr_weapons)
    @attr_weapons = attr_weapons
  end

  def name
    @attr_weapons["Name"]
  end

  def weapon_type
    @attr_weapons["Type"]
  end

  def skill
    @attr_weapons["SkillKey"]
  end

  def default_damage
    @attr_weapons["Damage"]
  end

  def default_crit
    @attr_weapons["Crit"]
  end

  def range
    @attr_weapons["RangeValue"]
  end

  def encum
    @attr_weapons["Encumbrance"]
  end

  def hp
    @attr_weapons["HP"]
  end

  def price
    @attr_weapons["Price"]
  end

  def rarity
    @attr_weapons["Rarity"]
  end

  def self.weapons
    Weapon.parse_weapons.map { |weapon| JsonWeapon.new(weapon) }
  end

  def attributes
    {
      name: name,
      weapon_type: weapon_type,
      skill: skill,
      range: range,
      encum: encum,
      hp: hp,
      price: price,
      rarity: rarity,
      default_damage: default_damage,
      default_crit: default_crit
    }
  end
end
