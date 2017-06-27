class Talent < ApplicationRecord

  has_many :sources, dependent: :destroy

  accepts_nested_attributes_for :sources, reject_if: ->(source) { source[:page].blank? || source[:book].blank? }, allow_destroy: true

  validates :name, :description, :ranked, :activation_value, :sources, presence: true

end
