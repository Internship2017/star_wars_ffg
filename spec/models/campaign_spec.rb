require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:campaign) { FactoryGirl.create :campaign }
  subject { campaign }

  it { should respond_to :name }
  it { should validate_presence_of :name }
  it { should be_valid() }
  it { should validate_uniqueness_of :name }
end
