class Career < ApplicationRecord
  before_validation :set_free_ranks, on: :create

  SKILLS = %w[Astrogation Athletics Charm Coercion Computers Cool Coordination Deception 
              Discipline Leadership Mechanics Medicine Negotiation Perception 
              Piloting-planetary Piloting-space Resilience Skulduggery Stealth Streetwise 
              Survival Vigilance Brawl Gunnery Lightsaber Melee Ranged-light Ranged-heavy 
              Core-worlds Education Lore Outer-rim Underworld Xenology Other].freeze

  validates :name, :description, :source_page, :source_book, 
            :career_skills, :free_ranks, presence: true

  validates :career_skills, length: { in: 1..10 }

  validates :source_page, :free_ranks, numericality: { only_integer: true }

  has_many :characters

  scope :with_name, ->(name) { where(name: name) }

  def set_free_ranks
    self.free_ranks = 3
  end

  def self.upload(json_file)
    JsonCareer.to_a(json_file).each do |json_career|
      json_career_attrs = json_career.attributes
      Career.with_name(json_career.name).first_or_create(json_career_attrs).update(json_career_attrs)
    end
  end

end