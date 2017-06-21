class Campaign < ApplicationRecord
  has_many :characters, dependant: :destroy


end
