require 'rails_helper'

RSpec.describe Talent, type: :model do
  let(:talent) { create :talent }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:ranked) }
  it { should respond_to(:activation_value) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:ranked) }
  it { should validate_presence_of(:activation_value) }
  it { should validate_presence_of(:sources) }
  it { should have_many(:sources) }
  
end
