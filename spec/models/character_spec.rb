require 'rails_helper'

RSpec.describe Character, type: :model do
  let(:character) { Character.new :character }

  it { should respond_to(:skills) }
end