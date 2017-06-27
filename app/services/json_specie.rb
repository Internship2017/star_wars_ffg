class JsonSpecie
  attr_reader :id, :name, :description, :source_page, :source_book, :brawn, :agility, :intellect, :cunning, :willpower,
              :presence, :wound_threshold, :strain_threshold, :experience, :skill_name, :skill_start_rank,
              :skill_limit_rank

  def initialize(attr_specie)
    @attr_specie = attr_specie
    @source = attr_specie["source"]
    @characteristics = attr_specie["characteristics"]
    @attributes = @attr_specie["attributes"]
    @skill_modifier = @attr_specie["skill_modifiers"]["skill"]
  end

  def name
    @attr_specie["name"]
  end

  def description
    @attr_specie["description"]
  end

  def source_page
    @source["page"]
  end

  def source_book
    @source["source_book"]
  end

  def brawn
    @characteristics["brawn"]
  end

  def agility
    @characteristics["agility"]
  end

  def intellect
    @characteristics["intellect"]
  end

  def cunning
    @characteristics["cunning"]
  end

  def willpower
    @characteristics["willpower"]
  end

  def presence
    @characteristics["presence"]
  end

  def skill_name
    @skill_modifier["name"]
  end

  def skill_start_rank
    @skill_modifier["start_rank"]
  end

  def skill_limit_rank
    @skill_modifier["limit_rank"]
  end

  def wound_threshold
    @attributes["wound_threshold"]
  end

  def strain_threshold
    @attributes["strain_threshold"]
  end

  def experience
    @attributes["experience"]
  end

  def self.to_a(json_file)
    json_data = JSON.parse(json_file.read)["Species"]
    json_data.map { |specie| JsonSpecie.new(specie) }
  end

  def attributes
    {
      name: name,
      description: description,
      source_page: source_page,
      source_book: source_book,
      brawn: brawn,
      agility: agility,
      intellect: intellect,
      cunning: cunning,
      willpower: willpower,
      presence: presence,
      wound_threshold: wound_threshold,
      strain_threshold: strain_threshold,
      experience: experience,
      skill_name: skill_name,
      skill_start_rank: skill_start_rank,
      skill_limit_rank: skill_limit_rank,
    }
  end
end
