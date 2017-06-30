FactoryGirl.define do
  factory :character_weapon do
    character
    weapon
    damage 1
    crit 1
  end
end
