require 'rails_helper'

RSpec.describe CharacterGear, type: :model do
  let(:character_gear) { create :character_gear }
	
	it { should belong_to(:character)}
  it { should belong_to(:gear)}
end
