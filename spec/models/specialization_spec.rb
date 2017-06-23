require 'rails_helper'

RSpec.describe Specialization, type: :model do
  let(:specialization) { create :specialization }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:source_page) }
  it { should respond_to(:source_book) }
  it { should respond_to(:career_skills) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:source_page) }
  it { should validate_presence_of(:source_book) }
  it { should validate_presence_of(:career_skills) }
  it { should validate_numericality_of(:source_page).only_integer }
  it { should belong_to(:career) }

  it "validates length of career_skills as 6 is valid" do
    specialization = FactoryGirl.build(:specialization, career_skills: %w[Warrior Guardian Healer Sniper Tank Paladin])
    expect(specialization).to be_valid
  end

  it "validates length of career_skills as 1 is valid" do
    specialization = FactoryGirl.build(:specialization, career_skills: %w[Healer])
    expect(specialization).to be_valid
  end

  it "validates length of career_skills as 10 is valid" do
    specialization = FactoryGirl.build(:specialization, career_skills: %w[Warrior Guardian Healer Sniper Tank Paladin Healer Sniper Tank Paladin])
    expect(specialization).to be_valid
  end

  it "validates length of career_skills as 0 is not valid" do
    specialization = FactoryGirl.build(:specialization, career_skills: [])
    expect(specialization).not_to be_valid
  end

  it "validates length of career_skills as 11 is not valid" do
    specialization = FactoryGirl.build(:specialization, career_skills: %w[Warrior Guardian Healer Sniper Tank Paladin Healer Sniper Tank Paladin Offtank])
    expect(specialization).not_to be_valid
  end
 
end