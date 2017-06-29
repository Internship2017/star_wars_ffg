class SpeciesUploader

  def initialize json_file
    @json_file = json_file
  end

  def run
    JsonSpecies.to_a(@json_file).each do |json_specie|
      json_specie_attrs = json_specie.attributes
      Species.with_name(json_specie.name).first_or_create(json_specie_attrs).update(json_specie_attrs)
    end
  end
end