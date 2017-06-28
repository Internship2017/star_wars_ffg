require 'rails_helper'

RSpec.describe Source, type: :model do
  let(:source) { create :source }

  it { should respond_to(:page) }
  it { should respond_to(:book) }
  it { should belong_to(:talent) }
  it { should validate_numericality_of(:page).only_integer }
  it { should validate_presence_of(:page) }
  it { should validate_presence_of(:book) }
  
end