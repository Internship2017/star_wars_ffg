class RemoveRankedFromTalent < ActiveRecord::Migration[5.1]
  def up
	change_column(:talents, :ranked, 'boolean USING CAST(ranked AS boolean)')
  end

  def down
	change_column(:talents, :ranked, :string)
  end
end
