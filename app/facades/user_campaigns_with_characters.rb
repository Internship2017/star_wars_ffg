class UserCampaignsWithCharacters

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def characters
    @characters ||= @user.characters
  end

  def campaigns
    @campaigns ||= Campaign.find(campaign_ids)
  end

  private

  def campaign_ids
    characters.pluck(:campaign_id)
  end

end