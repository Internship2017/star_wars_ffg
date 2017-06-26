class Talent < ApplicationRecord

  serialize :sources, Array

  validates :name, :description, :ranked, :activation_value, :sources, presence: true

  validates :sources, length: { minimum: 1 }

end
