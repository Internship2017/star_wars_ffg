class Career < ApplicationRecord
  before_create :set_free_ranks

  validates :name, :description, :source_page, :source_book, 
            :career_skills, :free_ranks, presence: true

  validates :career_skills, length: { is: 6 }

  validates :source_page, :free_ranks, numericality: { only_integer: true }

  has_many :characters

  def set_free_ranks
    self.free_ranks = 3
  end
end
