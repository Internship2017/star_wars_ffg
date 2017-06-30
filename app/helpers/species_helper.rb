module SpeciesHelper
  def species_collection
    @species_collection ||= Species.all
  end
end
