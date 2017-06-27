require 'rails_helper'

RSpec.describe "JsonSpecie", type: :service do

  before(:all) do
    json_file = File.open(Rails.root.join("spec/factories/assets/species.js"))
    @json_specie_array = JsonSpecie.to_a(json_file)
    @json_specie = @json_specie_array.first
  end

  it "should create 2 JsonSpecie objects from the json" do
    expect(@json_specie_array.count).to eql 2
  end

  it "should store the correct name" do
    expect(@json_specie.name).to eql "Aleena"
  end

  it "should store the correct description" do
    expect(@json_specie.description).to eql "See page 98 of the Nexus of Power Sourcebook"
  end

  it "should store the correct source_book" do
    expect(@json_specie.source_book).to eql "Nexus of Power"
  end

  it "should store the correct source_page" do
    expect(@json_specie.source_page).to eql "98"
  end

  it "should store the correct chracteristic brawn" do
    expect(@json_specie.brawn).to eql "1"
  end

  it "should store the correct chracteristic agility" do
    expect(@json_specie.agility).to eql "3"
  end

  it "should store the correct chracteristic intellect" do
    expect(@json_specie.intellect).to eql "2"
  end

  it "should store the correct chracteristic cunning" do
    expect(@json_specie.cunning).to eql "2"
  end

  it "should store the correct chracteristic willpower" do
    expect(@json_specie.willpower).to eql "2"
  end

  it "should store the correct chracteristic presence" do
    expect(@json_specie.presence).to eql "2"
  end

  it "should store the correct attribute wound_threshold" do
    expect(@json_specie.wound_threshold).to eql "8"
  end

  it "should store the correct attribute strain_threshold" do
    expect(@json_specie.strain_threshold).to eql "10"
  end

  it "should store the correct attribute experience" do
    expect(@json_specie.experience).to eql "95"
  end

  it "should store the correct skill modifier name" do
    expect(@json_specie.skill_name).to eql "Coordination"
  end

  it "should store the correct skill modifier start_rank" do
    expect(@json_specie.skill_start_rank).to eql "1"
  end

  it "should store the correct attribute experience" do
    expect(@json_specie.skill_limit_rank).to eql "2"
  end



end
