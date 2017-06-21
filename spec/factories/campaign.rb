FactoryGirl.define do
  factory :campaign do
    name { FFaker::Book.title }
  end
end