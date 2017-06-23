FactoryGirl.define do
  factory :talent do
    name { FFaker::Name.name }
    description { FFaker::Lorem.paragraph }
    sources { [{ page: rand(100).to_i, book: FFaker::Book.title }, { page: rand(100).to_i, book: FFaker::Book.title }] }
    ranked { FFaker::Internet.slug }
    activation_value { FFaker::Movie.rating }
  end
end