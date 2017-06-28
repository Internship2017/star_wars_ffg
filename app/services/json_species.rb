class JsonSpecies
  attr_reader :id, :name, :description, :source_page, :source_book, :brawn, :agility, :intellect, :cunning, :willpower,
              :presence, :wound_threshold, :strain_threshold, :experience, :skill_name, :skill_start_rank,
              :skill_limit_rank

  def initialize(attr_species)
    @attr_species = attr_species
    @source = attr_species["Source"]
    @characteristics = attr_species["StartingChars"]
    @attributes = @attr_species["StartingAttrs"]
  end

  def name
    @attr_species["Name"]
  end

  def description
    @attr_species["Description"]
  end

  def source_page
    @source["page"].to_i
  end

  def source_book
    @source["source_book"]
  end

  def brawn
    @characteristics["Brawn"].to_i
  end

  def agility
    @characteristics["Agility"].to_i
  end

  def intellect
    @characteristics["Intellect"].to_i
  end

  def cunning
    @characteristics["Cunning"].to_i
  end

  def willpower
    @characteristics["Willpower"].to_i
  end

  def presence
    @characteristics["Presence"].to_i
  end

  def skill_name
    "NA"
  end

  def skill_start_rank
    0
  end

  def skill_limit_rank
    2
  end

  def wound_threshold
    @attributes["WoundThreshold"].to_i
  end

  def strain_threshold
    @attributes["StrainThreshold"].to_i
  end

  def experience
    @attributes["Experience"].to_i
  end

  def self.to_a(json_file)
    json_data = JSON.parse(json_file.read)
    json_data = json_data["Species"]
    json_data.map { |species| JsonSpecies.new(species) }
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
      skill_limit_rank: skill_limit_rank
    }
  end
end
