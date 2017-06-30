FactoryGirl.define do
  factory :talent do
    name { FFaker::Name.name }
    description { FFaker::Lorem.paragraph }
    ranked { FFaker::Internet.slug }
    activation_value { FFaker::Movie.rating }
    factory :talent_with_sources do
      transient do
        sources_count 5
      end
      after :build do |talent, evaluator|
        talent.sources << FactoryGirl.build_list(:source, evaluator.sources_count, talent: nil)
      end
    end
  end
end