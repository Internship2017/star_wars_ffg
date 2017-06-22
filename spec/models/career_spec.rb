require 'rails_helper'

RSpec.describe Career, type: :model do
  let(:career) { create :career }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:free_ranks) }
  it { should respond_to(:source_page) }
  it { should respond_to(:source_book) }
  it { should respond_to(:career_skills) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:source_page) }
  it { should validate_presence_of(:source_book) }
  it { should validate_presence_of(:career_skills) }
  it { should validate_numericality_of(:source_page).only_integer }
  it { should have_many(:characters) }
  it "validates length of career_skills is 6" do
    career = create(:career, career_skills: %w[Warrior Guardian Healer Sniper Tank Paladin])
    expect(career).to be_valid
  end

  it "validates length of career_skills is not 6" do
    career = build(:career, career_skills: %w[Warrior Guardian])
    expect(career).not_to be_valid
  end

  it "should validate free_ranks is set as 3 after creation" do
    career = create(:career)
    expect(career.free_ranks).to eql 3
  end
 
end