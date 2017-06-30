require 'rails_helper'

RSpec.describe "JsonSpecies", type: :service do

  before(:all) do
    json_file = File.open(Rails.root.join("lib/data/Species.json"))
    @json_species_array = JsonSpecies.to_a(json_file)
    @json_species = @json_species_array.first
    @attributes = @json_species.attributes
  end

  it "should create 69 JsonSpecies objects from the json" do
    expect(@json_species_array.count).to eql 69
  end

  it "should store the correct name" do
    expect(@attributes[:name]).to eql "Aleena"
  end

  it "should store the correct description" do
    expect(@attributes[:description]).to eql "[H4]Aleena[h4]Please see page 98 of the Nexus of Power Sourcebook for details."
  end

  it "should store the correct source_book" do
    expect(@attributes[:source_book]).to eql "Nexus of Power"
  end

  it "should store the correct source_page" do
    expect(@attributes[:source_page]).to eql 98
  end

  it "should store the correct chracteristic brawn" do
    expect(@attributes[:brawn]).to eql 1
  end

  it "should store the correct chracteristic agility" do
    expect(@attributes[:agility]).to eql 3
  end

  it "should store the correct chracteristic intellect" do
    expect(@attributes[:intellect]).to eql 2
  end

  it "should store the correct chracteristic cunning" do
    expect(@attributes[:cunning]).to eql 2
  end

  it "should store the correct chracteristic willpower" do
    expect(@attributes[:willpower]).to eql 2
  end

  it "should store the correct chracteristic presence" do
    expect(@attributes[:presence]).to eql 2
  end

  it "should store the correct attribute wound_threshold" do
    expect(@attributes[:wound_threshold]).to eql 8
  end

  it "should store the correct attribute strain_threshold" do
    expect(@attributes[:strain_threshold]).to eql 10
  end

  it "should store the correct attribute experience" do
    expect(@attributes[:experience]).to eql 95
  end

  it "should store the correct skill modifier name" do
    expect(@attributes[:skill_name]).to eql "NA"
  end

  it "should store the correct skill modifier start_rank" do
    expect(@attributes[:skill_start_rank]).to eql 0
  end

  it "should store the correct attribute experience" do
    expect(@attributes[:skill_limit_rank]).to eql 2
  end

end
