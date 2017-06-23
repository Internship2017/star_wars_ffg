class CreateSpecializations < ActiveRecord::Migration[5.1]
  def change
    create_table :specializations do |t|
      t.string :name
      t.string :description
      t.string :source_page
      t.string :source_book
      t.string :career_skills, array: true, default: []
      t.references :career, foreign_key: true

      t.timestamps
    end
  end
end
