require 'rails_helper'

RSpec.describe "JsonTalent", type: :service do

  before(:all) do
    # File with 2 talent objects
    json_file = File.open(Rails.root.join("spec/assets/talent_seed.json"))
    @json_talent_array = JsonTalent.to_a(json_file)
    @json_talent = @json_talent_array.first
  end

  it "should create 2 JsonTalent objects from the json" do
    expect(@json_talent_array.count).to eql 2
  end

  it "should store the correct name" do
    expect(@json_talent.name).to eql "Adversary"
  end

  it "should store the correct description" do
    expect(@json_talent.description).to eql "Please see page 132 of the Edge of the Empire Core Rulebook, or page 142 of the Age of Rebellion Core Rulebook, for details."
  end

  it "should contain 2 sources" do
    expect(@json_talent.sources.count).to eql 2
  end

  it "should store the correct activation_value" do
    expect(@json_talent.activation_value).to eql "taPassive"
  end

  it "should store the correct ranked value" do
    expect(@json_talent.ranked).to eql "true"
  end

end