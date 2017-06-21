require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:campaign) { FactoryGirl.create :campaign }

  it { should respond_to(:name) }
  it { should validate_presence_of(:name) }
end