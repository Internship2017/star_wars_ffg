require 'rails_helper'

RSpec.describe Gear, type: :model do
  let(:gear) { create :gear }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:encum).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:rarity).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }
  it { should have_many(:character_gears) }
  it { should have_many(:characters).through(:character_gears) }

  describe "Ordered gears by rarity" do
    it "should return a weapon list ordered by rarity" do
      first_gear = FactoryGirl.create :gear, rarity: 4
      second_gear = FactoryGirl.create :gear, rarity: 5
      third_gear = FactoryGirl.create :gear, rarity: 6

      expect(Gear.order_by_rarity).to match_array [third_gear, second_gear, first_gear]
    end

    it "should return a gear list ordered by price" do
      first_gear = FactoryGirl.create :gear, price: 4
      second_gear = FactoryGirl.create :gear, price: 5
      third_gear = FactoryGirl.create :gear, price: 6

      expect(Gear.order_by_price).to match_array [third_gear, second_gear, first_gear]
    end

    it "should return a weapon list ordered by rarity and if it is the same rarity ordered by price" do
      first_gear = FactoryGirl.create :gear, rarity: 5, price: 5
      second_gear = FactoryGirl.create :gear, rarity: 5, price: 4
      third_gear = FactoryGirl.create :gear, rarity: 6, price: 3

      expect(Gear.order_by_rarity.order_by_price).to match_array [third_gear, first_gear, second_gear]
    end
  end

  describe "parse_gears" do
    it "should return all the gears as an array of hash wheb the input json is given" do
      expect(Gear.parse_gears("spec/factories/assets/gear_test.json")).to eql  [{"Name"=>"Comlink (handheld)", "Description"=>"[H3]Comlink (handheld)[h3]Please see page 171 of the Edge of the Empire Core Rulebook, page 186 of the Age of Rebellion Core Rulebook, or page 180 of the Force and Destiny Core Rulebook, for details.", "Sources"=>{"Source"=>[{"page"=>"171", "source_book"=>"Edge of the Empire Core Rulebook"}, {"page"=>"186", "source_book"=>"Age of Rebellion Core Rulebook"}, {"page"=>"180", "source_book"=>"Force and Destiny Core Rulebook"}]}, "Short"=>"A small handheld communications device", "Encumbrance"=>"0", "Price"=>"25", "Rarity"=>"0", "Type"=>"Communications"}]
    end
  end
end
