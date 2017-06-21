class AddCampaignToCharacter < ActiveRecord::Migration[5.1]
  def change
    add_reference :characters, :campaign, foreign_key: true
  end
end
