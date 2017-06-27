class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.integer :page
      t.string :book

      t.timestamps
    end
  end
end
