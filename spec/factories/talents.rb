FactoryGirl.define do
  factory :talent do
    name { FFaker::Name.name }
    description { FFaker::Lorem.paragraph }
    ranked { FFaker::Internet.slug }
    activation_value { FFaker::Movie.rating }
  end
end