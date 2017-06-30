class Talent < ApplicationRecord

  has_many :sources, dependent: :destroy

  accepts_nested_attributes_for :sources, reject_if: ->(source) { source[:page].blank? || source[:book].blank? }, allow_destroy: true

  validates :name, :description, :activation_value, presence: true

  validates :ranked, inclusion: { in: [true, false] }

  scope :with_name, ->(name) { where(name: name) }

  def self.upload(json_file)
    JsonTalent.to_a(json_file).each do |json_talent|
      json_talent_attrs = json_talent.attributes
      Talent.with_name(json_talent.name).first_or_create(json_talent_attrs).update(json_talent_attrs)
    end
  end

end
