class RemoveSourcesFromTalents < ActiveRecord::Migration[5.1]
  def up
	remove_column(:talents, :sources)
  end

  def down
	add_column(:talents, :sources)
  end
end
