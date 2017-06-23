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
  it { should have_many(:specializations) }

  it "validates length of career_skills as 6 is valid" do
    career = FactoryGirl.build(:career, career_skills: %w[Warrior Guardian Healer Sniper Tank Paladin])
    expect(career).to be_valid
  end

  it "validates length of career_skills as 1 is valid" do
    career = FactoryGirl.build(:career, career_skills: %w[Healer])
    expect(career).to be_valid
  end

  it "validates length of career_skills as 10 is valid" do
    career = FactoryGirl.build(:career, career_skills: %w[Warrior Guardian Healer Sniper Tank Paladin Healer Sniper Tank Paladin])
    expect(career).to be_valid
  end

  it "validates length of career_skills as 0 is not valid" do
    career = FactoryGirl.build(:career, career_skills: [])
    expect(career).not_to be_valid
  end

  it "validates length of career_skills as 11 is not valid" do
    career = FactoryGirl.build(:career, career_skills: %w[Warrior Guardian Healer Sniper Tank Paladin Healer Sniper Tank Paladin Offtank])
    expect(career).not_to be_valid
  end

  it "should validate free_ranks is set as 3 after creation" do
    career = create(:career)
    expect(career.free_ranks).to eql 3
  end

  describe "upload method" do

    before(:each) do
      # File with 2 career objects
      json_file = File.open(Rails.root.join("spec/factories/assets/careers.js"))
      Career.upload(json_file)
    end

    it "should create careers from a json file" do
      expect(Career.count).to eql 2
    end

    it "should create careers from a json file or update existing careers" do
      # File with 2 career objects(1 with changes from first file and one new)
      json_file_with_changes = File.open(Rails.root.join("spec/factories/assets/careers_change.js"))
      Career.upload(json_file_with_changes)
      expect(Career.count).to eql 3
      expect(Career.find_by(name: "Warrior").career_skills.first).to eql "Lightsaber"
    end
  end
 
end