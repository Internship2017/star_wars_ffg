FactoryGirl.define do
  factory :career do
    name { FFaker::Name.name }
    description { FFaker::Lorem.paragraph }
    free_ranks 5
    source_page { (rand * 100).to_i }
    source_book { "Force and Destiny Core Rulebook" }
    career_skills { [FFaker::Education.major, FFaker::Education.major, FFaker::Education.major, FFaker::Education.major, FFaker::Education.major, FFaker::Education.major] }
  end
end