require 'rails_helper'

RSpec.describe Weapon, type: :model do
  let(:weapon) { create :weapon }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:skill) }
  it { should validate_presence_of(:range) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:encum).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:hp).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:rarity).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:default_damage).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:default_crit).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should have_many(:character_weapons) }
  it { should have_many(:characters).through(:character_weapons) }

  describe "Odered weapons by rarity" do
    it "should return a weapon list ordered by rarity" do
      first_weapon = FactoryGirl.create :weapon, rarity: 4
      second_weapon = FactoryGirl.create :weapon, rarity: 5
      third_weapon = FactoryGirl.create :weapon, rarity: 6

      expect(Weapon.order_by_rarity).to match_array [third_weapon, second_weapon, first_weapon]
    end

    it "should return a weapon list ordered by price" do
      first_weapon = FactoryGirl.create :weapon, price: 4
      second_weapon = FactoryGirl.create :weapon, price: 5
      third_weapon = FactoryGirl.create :weapon, price: 6

      expect(Weapon.order_by_price).to match_array [third_weapon, second_weapon, first_weapon]
    end

    it "should return a weapon list ordered by rarity and if it is the same rarity ordered by price" do
      first_weapon = FactoryGirl.create :weapon, rarity: 5, price: 5
      second_weapon = FactoryGirl.create :weapon, rarity: 5, price: 4
      third_weapon = FactoryGirl.create :weapon, rarity: 6, price: 3

      expect(Weapon.order_by_rarity.order_by_price).to match_array [third_weapon, first_weapon, second_weapon]
    end
  end

  describe "parse_weapons" do
    it "should return all the weapons as an array of hash wheb the input json is given" do
      expect(Weapon.parse_weapons).to eql [{ "Name" => "Holdout Blaster", "Description" => "[H3]Holdout Blaster [h3] Please see page 161 of the Edge of the Empire Core Rulebook, page 174 of the Age of Rebellion Core Rulebook, or page 167 of the Force and Destiny Core Rulebook, for details.", "Sources" => { "Source" => [{ "page" => "161", "source_book" => "Edge of the Empire Core Rulebook" }, { "page" => "174", "source_book" => "Age of Rebellion Core Rulebook" }, { "page" => "167", "source_book" => "Force and Destiny Core Rulebook" }] }, "SkillKey" => "RANGLT", "Damage" => "5", "Crit" => "4", "RangeValue" => "wrShort", "Encumbrance" => "1", "HP" => "1", "Price" => "200", "Rarity" => "4", "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster Pistol", "Holdout Blaster", "Blaster", "Pistol", "Ranged"] }, "Qualities" => { "Quality" => { "Key" => "STUNSETTING" } } }, { "Name" => "TT24 Holdout Blaster", "Description" => "[H3]TT24 Holdout Pistol[h3] Please see page 26 of the Beyond the Rim Adventure Module for details.", "Source" => { "page" => "26", "source_book" => "Beyond the Rim" }, "SkillKey" => "RANGLT", "Damage" => "6", "Crit" => "3", "RangeValue" => "wrMedium", "Encumbrance" => "1", "HP" => "1", "Price" => "350", "Rarity" => "6", "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster Pistol", "Holdout Blaster", "Blaster", "Pistol", "Ranged"] }, "Qualities" => { "Quality" => { "Key" => "STUNSETTING" } } }, { "Name" => "Military Holdout Blaster", "Description" => "[H3]Military Holdout Blaster[h3] Please see page 44 of the Desperate Allies Sourcebook for details.", "Source" => { "page" => "44", "source_book" => "Desperate Allies" }, "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster", "Blaster Pistol", "Holdout Blaster", "Pistol", "Ranged"] }, "Encumbrance" => "1", "HP" => "0", "Price" => "500", "Rarity" => "5", "Restricted" => "false", "BaseMods" => { "Mod" => [{ "MiscDesc" => "Add [SETBACK] to Perception checks to find this weapon on a body." }, { "MiscDesc" => "Can run out of ammo by spending [THREAT][THREAT][THREAT]." }] }, "SkillKey" => "RANGLT", "Damage" => "6", "DamageAdd" => "0", "Crit" => "3", "RangeValue" => "wrShort", "Qualities" => { "Quality" => { "Key" => "STUNSETTING" } } }, { "Name" => "Variable Holdout Blaster", "Description" => "[H3]Variable Holdout Blaster[h3] Please see page 104 of the Strongholds of Resistance Sourcebook for details.", "Source" => { "page" => "104", "source_book" => "Strongholds of Resistance" }, "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster", "Blaster Pistol", "Holdout Blaster", "Pistol", "Ranged"] }, "Encumbrance" => "1", "HP" => "0", "Price" => "400", "Rarity" => "7", "Restricted" => "false", "SkillKey" => "RANGLT", "Damage" => "7", "DamageAdd" => "0", "Crit" => "4", "RangeValue" => "wrShort", "Qualities" => { "Quality" => { "Key" => "LIMITEDAMMO", "Count" => "12" } }, "BaseMods" => { "Mod" => [{ "MiscDesc" => "Anyone searching an individual carrying a concealed variable holdout blaster adds [SETBACK] to their Perception checks." }, { "MiscDesc" => "Wielder must choose a power setting between 1 and 7.  This is the amount of damage a successful shot will inflict, and is also the amount of ammo expended." }] } }, { "Name" => "Model Q4 Quickfire", "Description" => "[H3]Model Q4 Quickfire[h3] Please see page 40 of the Far Horizons Sourcebook for details.", "Source" => { "page" => "40", "source_book" => "Far Horizons" }, "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster", "Blaster Pistol", "Pistol", "Ranged"] }, "Encumbrance" => "1", "HP" => "0", "Price" => "250", "Rarity" => "4", "Restricted" => "false", "BaseMods" => { "Mod" => { "MiscDesc" => "Add [SETBACK] to Perception checks to find this weapon on a body.  May not be reloaded." } }, "SkillKey" => "RANGLT", "Damage" => "5", "DamageAdd" => "0", "Crit" => "3", "RangeValue" => "wrShort", "Qualities" => { "Quality" => { "Key" => "STUNSETTING" } } }, { "Name" => "12 Defender", "Description" => "[H3]12 Defender[h3] Please see page 40 of the Far Horizons Sourcebook for details.", "Source" => { "page" => "40", "source_book" => "Far Horizons" }, "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster", "Blaster Pistol", "Pistol", "Ranged"] }, "Encumbrance" => "1", "HP" => "0", "Price" => "25", "Rarity" => "4", "Restricted" => "false", "BaseMods" => { "Mod" => { "MiscDesc" => "Add [SETBACK][SETBACK] to Perception and Computers checks to find this weapon on a body.  May not be reloaded." } }, "SkillKey" => "RANGLT", "Damage" => "5", "DamageAdd" => "0", "Crit" => "5", "RangeValue" => "wrShort", "Qualities" => { "Quality" => [{ "Key" => "INFERIOR" }, { "Key" => "LIMITEDAMMO", "Count" => "2" }] } }, { "Name" => "Defender Sporting Blaster Pistol", "Description" => "[H3]Defender Sporting Blaster Pistol[h3]Please see page 44 of the Desperate Allies Sourcebook for details.", "Source" => { "page" => "44", "source_book" => "Desperate Allies" }, "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster", "Blaster Pistol", "Pistol", "Ranged"] }, "Encumbrance" => "1", "HP" => "1", "Price" => "650", "Rarity" => "6", "Restricted" => "false", "SkillKey" => "RANGLT", "Damage" => "5", "DamageAdd" => "0", "Crit" => "3", "RangeValue" => "wrMedium", "Qualities" => { "Quality" => [{ "Key" => "ACCURATE", "Count" => "1" }, { "Key" => "STUNSETTING" }] } }, { "Name" => "ELG-3A Blaster Pistol", "Description" => "[H3]ELG-3A Blaster Pistol[h3] Please see page 44 of the Desperate Allies Sourcebook for details.", "Source" => { "page" => "44", "source_book" => "Desperate Allies" }, "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster", "Blaster Pistol", "Pistol", "Ranged"] }, "Encumbrance" => "1", "HP" => "0", "Price" => "400", "Rarity" => "5", "Restricted" => "false", "BaseMods" => { "Mod" => { "MiscDesc" => "Add [SETBACK][SETBACK] to Perception checks to find this weapon on a body." } }, "SkillKey" => "RANGLT", "Damage" => "6", "DamageAdd" => "0", "Crit" => "4", "RangeValue" => "wrShort", "Qualities" => { "Quality" => { "Key" => "STUNSETTING" } } }, { "Name" => "Light Blaster Pistol", "Description" => " [H3]Light Blaster Pistol[h3] Please see page 161 of the Edge of the Empire Core Rulebook, page 174 of the Age of Rebellion Core Rulebook, or page 167 of the Force and Destiny Core Rulebook, for details.", "Sources" => { "Source" => [{ "page" => "161", "source_book" => "Edge of the Empire Core Rulebook" }, { "page" => "174", "source_book" => "Age of Rebellion Core Rulebook" }, { "page" => "167", "source_book" => "Force and Destiny Core Rulebook" }] }, "SkillKey" => "RANGLT", "Damage" => "5", "Crit" => "4", "RangeValue" => "wrMedium", "Encumbrance" => "1", "HP" => "2", "Price" => "300", "Rarity" => "4", "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster Pistol", "Blaster", "Pistol", "Ranged"] }, "Qualities" => { "Quality" => { "Key" => "STUNSETTING" } } }]
    end
  end
end
