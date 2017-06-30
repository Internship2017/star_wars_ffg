class CharacterGear < ApplicationRecord
  belongs_to :character
  belongs_to :gear
end
