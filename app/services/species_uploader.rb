class SpeciesUploader

  def initialize json_file
    @json_file = json_file
  end

  def run
    JsonSpecies.to_a(@json_file).each do |json_specie|
      create_or_update_species(json_specie.attributes)
    end
  end

  private

  def create_or_update_species json_specie_attributes
    Species.with_name(json_specie_attributes["name"]).first_or_create(json_specie_attributes).update(json_specie_attributes)
  end
end