class JsonTalent
  attr_reader :name, :description, :activation_value, :ranked, :sources

  def initialize(attr_talent)
    @attr_talent = attr_talent
  end

  def name
    @attr_talent["Name"]
  end

  def description
    @attr_talent["Description"]
  end

  def ranked
    @attr_talent["Ranked"]
  end

  def activation_value
    @attr_talent["ActivationValue"]
  end

  def sources
    @attr_talent["Sources"]["Source"].map{ |source_attrs| Source.new(source_attrs)} 
  end

  def self.to_a(json_file)
    json_data = JSON.parse(json_file.read)["Talents"]["Talent"]
    json_data.map { |talent_attrs| JsonTalent.new(talent_attrs) }
  end

  def attributes
    {
      name: name,
      description: description,
      activation_value: activation_value,
      ranked: ranked,
      sources: sources
    }  
  end
end