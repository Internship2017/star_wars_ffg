require 'rails_helper'
require_relative '../../app/facades/user_campaigns_with_characters'

describe 'UserCampaignsWithCharacters' do

  it 'Should have respond to user' do
    character = FactoryGirl.create :character
    user = character.user
    campaigns_characters = UserCampaignsWithCharacters.new(user)
    expect(campaigns_characters.user).to eql user
  end

  it 'Should respond to characters' do
    user = FactoryGirl.create :user
    characters = FactoryGirl.create_list :character, 3, user: user
    campaigns_characters = UserCampaignsWithCharacters.new(user)
    expect(campaigns_characters.characters).to match_array characters
  end

  it 'Should respond to campaigns' do
    user = FactoryGirl.create :user
    campaigns = FactoryGirl.create_list :campaign, 5
    campaigns.each do |campaign|
      FactoryGirl.create :character, user: user, campaign: campaign
    end
    campaigns_characters = UserCampaignsWithCharacters.new(user)
    expect(campaigns_characters.campaigns).to match_array campaigns
  end
end