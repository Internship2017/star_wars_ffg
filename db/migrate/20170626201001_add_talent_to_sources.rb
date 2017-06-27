class AddTalentToSources < ActiveRecord::Migration[5.1]
  def change
    add_reference :sources, :talent, foreign_key: true
  end
end
