class Career < ApplicationRecord
  before_validation  :set_free_ranks

  SKILLS = %w[Astrogation Athletics Charm Coercion Computers Cool Coordination Deception 
              Discipline Leadership Mechanics Medicine Negotiation Perception 
              Piloting-planetary Piloting-space Resilience Skulduggery Stealth Streetwise 
              Survival Vigilance Brawl Gunnery Lightsaber Melee Ranged-light Ranged-heavy 
              Core-worlds Education Lore Outer-rim Underworld Xenology Other].freeze

  validates :name, :description, :source_page, :source_book, 
            :career_skills, :free_ranks, presence: true

  validates :career_skills, length: { is: 6 }

  validates :source_page, :free_ranks, numericality: { only_integer: true }

  has_many :characters

  def set_free_ranks
    self.free_ranks = 3
  end

end
