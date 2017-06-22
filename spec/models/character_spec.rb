require 'rails_helper'

RSpec.describe Character, type: :model do
  let(:character) { create :character }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:force_rating).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:emotional_strength) }
  it { should validate_presence_of(:emotional_weakness) }
  it { should validate_numericality_of(:conflict).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:morality).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100) }
  it { should validate_presence_of(:gender) }
  it { should validate_numericality_of(:age).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:build) }
  it { should validate_presence_of(:hair) }
  it { should validate_presence_of(:eyes) }
  it { should validate_presence_of(:notable_features) }
  it { should validate_numericality_of(:total_xp).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:available_xp).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:soak_value).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:threshold_wounds).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:current_wounds).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:threshold_strain).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:current_strain).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:ranged_defense).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:melee_defense).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:brawn).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }
  it { should validate_numericality_of(:agility).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }
  it { should validate_numericality_of(:intellect).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }
  it { should validate_numericality_of(:cunning).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }
  it { should validate_numericality_of(:will_power).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }
  it { should validate_numericality_of(:presence).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }
  it { should validate_numericality_of(:credits).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:motivations) }
  it { should validate_presence_of(:species) }
  it { should validate_presence_of(:campaign) }
  it { should have_many(:skills) }
  it { should belong_to(:career) }
  it { should belong_to(:campaign) }
  it { should have_many(:character_weapons) }
  it { should have_many(:weapons).through(:character_weapons) }
end

