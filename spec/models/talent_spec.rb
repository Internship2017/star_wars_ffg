require 'rails_helper'

RSpec.describe Talent, type: :model do
  let(:talent) { create :talent }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:ranked) }
  it { should respond_to(:activation_value) }
  it { should respond_to(:sources) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:ranked) }
  it { should validate_presence_of(:activation_value) }
  it { should validate_presence_of(:sources) }

  it "validates length of sources, as 0 is not valid" do
    talent = FactoryGirl.build(:talent, sources: [])
    expect(talent).not_to be_valid
  end

  it "validates length of sources, as 1 is valid" do
    talent = FactoryGirl.build(:talent, sources: [{ page: 25, book: "This new book" }])
    expect(talent).to be_valid
  end

  it "validates length of sources, as 5 is valid" do
    talent = FactoryGirl.build(:talent, sources: [{ page: 25, book: "This new book" }, { page: 26, book: "This newer book" }, 
                                                  { page: 40, book: "The newest book" }, { page: 200, book: "This old book" }, 
                                                  { page: 101, book: "This older book" }])
    expect(talent).to be_valid
  end

  it "validates length of sources, as 10 is valid" do
    talent = FactoryGirl.build(:talent, sources: [{ page: 25, book: "This new book" }, { page: 26, book: "This newer book" }, 
                                                  { page: 40, book: "The newest book" }, { page: 200, book: "This old book" }, 
                                                  { page: 101, book: "This older book" }, { page: 202, book: "The oldest book" }, 
                                                  { page: 404, book: "This cool book" }, { page: 500, book: "This shitty book" }, 
                                                  { page: 502, book: "This rare book" }])
    expect(talent).to be_valid
  end

  it "validates length of sources, as 11 is not valid" do
    talent = FactoryGirl.build(:talent, sources: [{ page: 25, book: "This new book" }, { page: 26, book: "This newer book" }, 
                                                  { page: 40, book: "The newest book" }, { page: 200, book: "This old book" }, 
                                                  { page: 101, book: "This older book" }, { page: 202, book: "The oldest book" }, 
                                                  { page: 404, book: "This cool book" }, { page: 500, book: "This shitty book" }, 
                                                  { page: 502, book: "This rare book" }, { page: 510, book: "This big book" }])
    expect(talent).not_to be_valid
  end
end
