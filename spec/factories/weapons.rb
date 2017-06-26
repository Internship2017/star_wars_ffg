FactoryGirl.define do
  factory :weapon do
    name { ["Holdout Blaster", "Light Blaster Pistol", "Blaster Pistol", "Heavy Blaster", "Blaster Carbine", "Blaster Riffle"].sample }
    skill "Light Range"
    range "medium"
    encum 1
    hp 1
    price { rand(200...210) }
    rarity { rand(1...7) }
    default_damage 1
    default_crit 1
  end
end
