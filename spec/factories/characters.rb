FactoryGirl.define do
  factory :character do
    name { FFaker::Name.name }
    force_rating 1
    user
    emotional_strength { FFaker::Lorem.paragraph }
    emotional_weakness { FFaker::Lorem.paragraph }
    conflict 0
    morality 50
    gender "male"
    age { (rand() * 100).to_i }
    height { "1.90 mts" }
    build "robust"
    hair "ginger"
    eyes "green"
    notable_features { FFaker::Lorem.paragraph }
    total_xp 0
    available_xp 0
    soak_value 0
    threshold_wounds 0
    current_wounds 0
    threshold_strain 0
    current_strain 0
    ranged_defense 0
    melee_defense 0
    brawn 0
    agility 0
    intellect 0
    cunning 0
    will_power 0
    presence 0
    credits 500
    motivations { FFaker::Lorem.paragraph }
    species "human"
  end
end
