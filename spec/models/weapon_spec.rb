require 'rails_helper'

RSpec.describe Weapon, type: :model do
  let(:weapon) { FactoryGirl.create :weapon }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:skill) }
  it { should validate_presence_of(:range) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:encum).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:hp).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:rarity).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should have_many(:characters)}
end
