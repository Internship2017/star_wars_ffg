FactoryGirl.define do
  factory :source do
    page { rand(100).to_i }
    book { FFaker::Book.title }
    talent
  end
end