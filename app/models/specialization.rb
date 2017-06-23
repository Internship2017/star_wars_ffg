class Specialization < ApplicationRecord
  belongs_to :career

  SKILLS = %w[Astrogation Athletics Charm Coercion Computers Cool Coordination Deception 
              Discipline Leadership Mechanics Medicine Negotiation Perception 
              Piloting-planetary Piloting-space Resilience Skulduggery Stealth Streetwise 
              Survival Vigilance Brawl Gunnery Lightsaber Melee Ranged-light Ranged-heavy 
              Core-worlds Education Lore Outer-rim Underworld Xenology Other].freeze

  validates :name, :description, :source_page, :source_book, 
            :career_skills, presence: true

  validates :career_skills, length: { in: 1..10 }

  validates :source_page, numericality: { only_integer: true }
end
