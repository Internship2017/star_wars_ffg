class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.string :name
      t.text :description
      t.integer :free_ranks
      t.integer :source_page
      t.string :source_book
      t.string :career_skills, array: true, default: []

      t.timestamps
    end
  end
end
