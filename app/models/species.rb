class Species < ApplicationRecord
  validates :name, :description, :source_page, :source_book, :brawn, :agility, :intellect, :cunning, :willpower,
            :presence, :wound_threshold, :strain_threshold, :experience, :skill_name, :skill_start_rank,
            :skill_limit_rank, presence: true

  validates :source_page, :experience, :skill_start_rank, :skill_limit_rank, numericality: { only_integer: true,
                                                                                             greater_than_or_equal_to: 0 }

  validates :brawn, :agility, :intellect, :cunning, :willpower, :presence, numericality: { only_integer: true,
                                                                                           greater_than_or_equal_to: 0,
                                                                                           less_than_or_equal_to: 5 }

  validates :wound_threshold, :strain_threshold, numericality: { only_integer: true, greater_than_or_equal_to: 0,
                                                                 less_than_or_equal_to: 99 }

  scope :with_name, ->(name) { where(name: name) }

  def self.upload(json_file)
    JsonSpecies.to_a(json_file).each do |json_specie|
      json_specie_attrs = json_specie.attributes
      Species.with_name(json_specie.name).first_or_create(json_specie_attrs).update(json_specie_attrs)
    end
  end
end
