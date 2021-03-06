class JsonCareer
  attr_reader :name, :description, :source_page, :source_book, :career_skills, :free_ranks

  def initialize(attr_career)
    @attr_career = attr_career
    @source = attr_career["Source"]
  end

  def name
    @attr_career["Name"]
  end

  def description
    @attr_career["Description"]
  end

  def source_page
    @source["page"]
  end

  def source_book
    @source["source_book"]
  end

  def career_skills
    @attr_career["CareerSkills"]
  end

  def free_ranks
    @attr_career["FreeRanks"]
  end

  def self.to_a(json_file)
    json_data = JSON.parse(json_file.read)["Careers"]
    json_data.map { |career| JsonCareer.new(career) }
  end

  def attributes
    {
      name: name,
      description: description,
      source_page: source_page,
      source_book: source_book,
      career_skills: career_skills,
      free_ranks: free_ranks
    }  
  end
end