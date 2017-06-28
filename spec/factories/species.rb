FactoryGirl.define do
  factory :species do
    name { FFaker::Book.title }
    description { FFaker::Lorem.paragraph }
    source_page { (rand * 100).to_i }
    source_book "Force and Destiny Core Rulebook"
    brawn 1
    agility 1
    intellect 1
    cunning 1
    willpower 1
    presence 1
    wound_threshold 50
    strain_threshold 50
    experience 50
    skill_name { FFaker::Name.name }
    skill_start_rank 1
    skill_limit_rank 1
  end
end
