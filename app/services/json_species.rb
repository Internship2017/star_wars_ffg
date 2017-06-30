class JsonSpecies

  def initialize(attr_species)
    @attr_species = attr_species
    @source = attr_species["Source"]
    @characteristics = attr_species["StartingChars"]
    @basic_attrs = @attr_species["StartingAttrs"]
  end

  def attributes
    basic.merge(characteristics).merge(skill).merge(source)
  end

  def self.to_a(json_file)
    json_data = JSON.parse(json_file.read)["Species"]
    json_data.map { |species| JsonSpecies.new(species) }
  end

  private

  def basic
    {
      name: @attr_species["Name"],
      description: @attr_species["Description"],
      experience: @basic_attrs["Experience"].to_i,
      wound_threshold: @basic_attrs ["WoundThreshold"].to_i,
      strain_threshold: @basic_attrs ["StrainThreshold"].to_i
    }
  end

  def characteristics
    {
      brawn: @characteristics["Brawn"].to_i,
      agility: @characteristics["Agility"].to_i,
      intellect: @characteristics["Intellect"].to_i,
      cunning: @characteristics["Cunning"].to_i,
      willpower: @characteristics["Willpower"].to_i,
      presence: @characteristics["Presence"].to_i
    }
  end

  def skill
    {
      skill_name: 'NA',
      skill_start_rank: 0,
      skill_limit_rank: 2
    }
  end

  def source
    {
      source_page: @source["page"].to_i,
      source_book: @source["source_book"]
    }
  end
end
