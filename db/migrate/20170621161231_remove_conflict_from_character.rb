class RemoveConflictFromCharacter < ActiveRecord::Migration[5.1]
  def up
	change_column(:characters, :conflict, 'integer USING CAST(conflict AS integer)')
  end

  def down
	change_column(:characters, :conflict, :string)
  end
end
