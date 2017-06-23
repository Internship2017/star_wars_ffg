class CreateTalents < ActiveRecord::Migration[5.1]
  def change
    create_table :talents do |t|
      t.string :name
      t.string :description
      t.text   :sources
      t.string :ranked
      t.string :activation_value

      t.timestamps
    end
  end
end
