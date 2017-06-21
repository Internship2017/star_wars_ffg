require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { FactoryGirl.create :skill }

  it { should respond_to(:name) }
  it { should respond_to(:characteristic) }
  it { should respond_to(:type_of_skill) }
  it { should respond_to(:difficulty) }
end