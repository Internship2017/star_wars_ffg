require 'rails_helper'

RSpec.describe CharacterWeapon, type: :model do
  let(:character_weapon) { FactoryGirl.create :character_weapon }

  it { should validate_presence_of(:weapon) }
  it { should validate_presence_of(:character) }
  it { should validate_presence_of(:special) }
	it { should validate_numericality_of(:damage).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
	it { should validate_numericality_of(:crit).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }

end