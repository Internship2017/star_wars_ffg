require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { FactoryGirl.create :skill }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:characteristic) }
  it { should validate_presence_of(:type_of_skill) }
  it { should validate_presence_of(:difficulty) }
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:rank).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }


end

describe "Skill" do 
	describe "parse_skills" do
		it "should return all the skills of the jason" do 
			file = File.read("#{Rails.root}/lib/data/Skills.json")
		  	data_hash = JSON.parse(file)
		  	hash_of_skills = data_hash["Skills"]["Skill"]
		  	expect(Skill.parse_skills).to eql hash_of_skills

		end
	end

end