require 'rails_helper'

RSpec.describe User, type: :model do
  let(:campaign) { FactoryGirl.create :campaign }

  it { should respond_to(:name) }
  it { should validates_presence_of(:name) }
end
