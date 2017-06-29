require 'rails_helper'

RSpec.describe "SpeciesUploader", type: :service do

  it 'should upload 68 species from json file to db' do
    json_file = File.open(Rails.root.join("lib/data/Species.json"))
    SpeciesUploader.new(json_file).run

    expect(Species.all.count).to eql 68
  end
end