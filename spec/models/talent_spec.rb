require 'rails_helper'

RSpec.describe Talent, type: :model do
  let(:talent) { create :talent }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:ranked) }
  it { should respond_to(:activation_value) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:activation_value) }
  it { should have_many(:sources) }

  describe "upload method" do

    before(:each) do
      # File with 2 career objects
      json_file = File.open(Rails.root.join("spec/assets/talent_seed.json"))
      Talent.upload(json_file)
    end

    it "should create talent from a json file" do
      expect(Talent.count).to eql 2
    end

    it "should create talent from a json file or update existing talent" do
      # File with 2 career objects(1 with changes from first file and one new)
      json_file_with_changes = File.open(Rails.root.join("spec/assets/talent_seed_change.json"))
      Talent.upload(json_file_with_changes)
      expect(Talent.count).to eql 3
      expect(Talent.find_by(name: "Adversary").sources.first.page).to eql 133
    end
  end
  
end
