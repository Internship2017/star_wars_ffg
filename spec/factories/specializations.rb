FactoryGirl.define do
  factory :specialization do
    name { FFaker::Name.name }
    description { FFaker::Lorem.paragraph }
    source_page { (rand * 100).to_i }
    source_book { "Force and Destiny Core Rulebook" }
    career_skills { [FFaker::Education.major, FFaker::Education.major, FFaker::Education.major, FFaker::Education.major, FFaker::Education.major, FFaker::Education.major] }
  end
end