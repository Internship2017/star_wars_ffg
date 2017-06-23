require 'rails_helper'

RSpec.describe "JsonCareer", type: :service do

  before(:all) do
    #File with 2 career objects
    json_file = File.open(Rails.root.join("spec/factories/assets/careers.js"))
    json_data = JSON.parse(json_file.read)["Careers"]
    @json_careers_array = JsonCareer.to_a(json_data)
    @json_career = @json_careers_array.first
  end

  it "should create 2 JsonCareer objects from the json" do
    expect(@json_careers_array.count).to eql 2
    expect(@json_careers_array.first.class).to eql JsonCareer
  end

  it "should store the correct name" do
    expect(@json_career.name).to eql "Warrior"
  end

  it "should store the correct description" do
    expect(@json_career.description).to eql "[H4]Warrior[h4] Please see page 96 of the Force and Destiny Core Rulebook for details."
  end

  it "should store the correct source_book" do
    expect(@json_career.source_book).to eql "Force and Destiny Core Rulebook"
  end

  it "should store the correct source_page" do
    expect(@json_career.source_page).to eql "97"
  end

  it "should store the correct free_ranks" do
    expect(@json_career.free_ranks).to eql "3"
  end

  it "should store the correct career_skills" do
    expect(@json_career.career_skills).to match_array(%w[Athletics Brawl Cool Melee Perception Survival])
  end


end