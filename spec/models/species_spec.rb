require 'rails_helper'

RSpec.describe Species, type: :model do
	let(:species) { create :species }
	
	#Presence
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:description) }
	it { should validate_presence_of(:source_page) }
	it { should validate_presence_of(:source_book) }
	it { should validate_presence_of(:brawn) }
	it { should validate_presence_of(:agility) }
	it { should validate_presence_of(:intellect) }
	it { should validate_presence_of(:cunning) }
	it { should validate_presence_of(:willpower) }
	it { should validate_presence_of(:presence) }
	it { should validate_presence_of(:wound_threshold) }
	it { should validate_presence_of(:strain_threshold) }
	it { should validate_presence_of(:experience) }
	it { should validate_presence_of(:skill_name) }
	it { should validate_presence_of(:skill_start_rank) }
	it { should validate_presence_of(:skill_limit_rank) }
	
	#Numericality
	it { should validate_numericality_of(:experience).is_greater_than_or_equal_to(0) }
	it { should validate_numericality_of(:skill_start_rank).is_greater_than_or_equal_to(0) }
	it { should validate_numericality_of(:skill_limit_rank).is_greater_than_or_equal_to(0) }	
	it { should validate_numericality_of(:source_page).is_greater_than_or_equal_to(0) }	 
	it { should validate_numericality_of(:brawn).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }		 
	it { should validate_numericality_of(:agility).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }		 
	it { should validate_numericality_of(:intellect).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }		 
	it { should validate_numericality_of(:cunning).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }		 
	it { should validate_numericality_of(:willpower).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }		 
	it { should validate_numericality_of(:presence).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5) }		 
	it { should validate_numericality_of(:wound_threshold).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99) }		 
	it { should validate_numericality_of(:strain_threshold).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(99 ) }
end 
