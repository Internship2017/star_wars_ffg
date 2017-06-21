class AddCareerToCharacter < ActiveRecord::Migration[5.1]
  def change
    add_reference :characters, :career, foreign_key: true
  end
end
