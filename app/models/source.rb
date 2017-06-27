class Source < ApplicationRecord

  belongs_to :talent

  validates :book, :page, presence: true

  validates :page, numericality: { only_integer: true }
end
