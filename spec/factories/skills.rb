FactoryGirl.define do
  factory :skill do
    name { FFaker::Name.name }
    description { FFaker::Lorem.paragraph }
    difficulty { FFaker::Lorem.paragraph }
    characteristic "brawn"
    type_of_skill "combat"
    character
    rank 0
  end
end
