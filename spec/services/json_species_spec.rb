require 'rails_helper'

RSpec.describe "JsonSpecies", type: :service do

  before(:all) do
    #spec/factories/assets/species.js
    json_file = File.open(Rails.root.join("lib/data/Species.json"))
    @json_species_array = JsonSpecies.to_a(json_file)
    @json_species = @json_species_array.first
  end

  it "should create 2 JsonSpecies objects from the json" do
    expect(@json_species_array.count).to eql 2
  end

  it "should store the correct name" do
    expect(@json_species.name).to eql "Aleena"
  end

  it "should store the correct description" do
    expect(@json_species.description).to eql "[H4]Aleena[h4] Please see page 98 of the Nexus of Power Sourcebook for details."
  end

  it "should store the correct source_book" do
    expect(@json_species.source_book).to eql "Nexus of Power"
  end

  it "should store the correct source_page" do
    expect(@json_species.source_page).to eql "98"
  end

  it "should store the correct chracteristic brawn" do
    expect(@json_species.brawn).to eql "1"
  end

  it "should store the correct chracteristic agility" do
    expect(@json_species.agility).to eql "3"
  end

  it "should store the correct chracteristic intellect" do
    expect(@json_species.intellect).to eql "2"
  end

  it "should store the correct chracteristic cunning" do
    expect(@json_species.cunning).to eql "2"
  end

  it "should store the correct chracteristic willpower" do
    expect(@json_species.willpower).to eql "2"
  end

  it "should store the correct chracteristic presence" do
    expect(@json_species.presence).to eql "2"
  end

  it "should store the correct attribute wound_threshold" do
    expect(@json_species.wound_threshold).to eql "8"
  end

  it "should store the correct attribute strain_threshold" do
    expect(@json_species.strain_threshold).to eql "10"
  end

  it "should store the correct attribute experience" do
    expect(@json_species.experience).to eql "95"
  end

  it "should store the correct skill modifier name" do
    expect(@json_species.skill_name).to eql "Coordination"
  end

  it "should store the correct skill modifier start_rank" do
    expect(@json_species.skill_start_rank).to eql "1"
  end

  it "should store the correct attribute experience" do
    expect(@json_species.skill_limit_rank).to eql "2"
  end

end