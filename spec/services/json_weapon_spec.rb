require 'rails_helper'

RSpec.describe JsonWeapon, type: :service do
  let(:json_weapon) { 
    JsonWeapon.new(
      "Name" => "Holdout Blaster", "Description" => "[H3]Holdout Blaster [h3] Please see page 161 of the Edge of the Empire Core Rulebook, page 174 of the Age of Rebellion Core Rulebook, or page 167 of the Force and Destiny Core Rulebook, for details.", "Sources" => { "Source" => [{ "page" => "161", "source_book" => "Edge of the Empire Core Rulebook" }, { "page" => "174", "source_book" => "Age of Rebellion Core Rulebook" }, { "page" => "167", "source_book" => "Force and Destiny Core Rulebook" }] }, "SkillKey" => "RANGLT", "Damage" => "5", "Crit" => "4", "RangeValue" => "wrShort", "Encumbrance" => "1", "HP" => "1", "Price" => "200", "Rarity" => "4", "Type" => "Energy Weapon", "Categories" => { "Category" => ["Blaster Pistol", "Holdout Blaster", "Blaster", "Pistol", "Ranged"] }, "Qualities" => { "Quality" => { "Key" => "STUNSETTING" } }
    ) 
  }

  it "return 'Holdout Blaster' name from the JSON file" do
    expect(json_weapon.name).to eql "Holdout Blaster"
  end

  it "return 'RANGLT' skill from the JSON file" do
    expect(json_weapon.skill).to eql "RANGLT"
  end

  it "return 'wrShort' range from the JSON file" do
    expect(json_weapon.range).to eql "wrShort"
  end

  it "return '1' encum from the JSON file" do
    expect(json_weapon.encum).to eql "1"
  end

  it "return '1' hp from the JSON file" do
    expect(json_weapon.hp).to eql "1"
  end

  it "return '200' price from the JSON file" do
    expect(json_weapon.price).to eql "200"
  end

  it "return '4' rarity from the JSON file" do
    expect(json_weapon.rarity).to eql "4"
  end
end
