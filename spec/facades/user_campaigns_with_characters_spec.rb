require 'rails_helper'
require_relative '../../app/facades/user_campaigns_with_characters'

describe 'UserCampaignsWithCharacters' do

  before(:each) do
    @user = create :user
  end

  it 'should have respond to user' do
    character = create :character, user: @user
    user = character.user
    campaigns_characters = UserCampaignsWithCharacters.new(user)
    expect(campaigns_characters.user).to eql @user
  end

  it 'characters method should return an array of characters per user' do
    characters = create_list :character, 3, user: @user
    campaigns_characters = UserCampaignsWithCharacters.new(@user)
    expect(campaigns_characters.characters).to match_array characters
  end

  it 'campaigns method should return an array of campaigns per user' do
    campaigns = create_list :campaign, 5
    campaigns.each do |campaign|
      create :character, user: @user, campaign: campaign
    end
    campaigns_characters = UserCampaignsWithCharacters.new(@user)
    expect(campaigns_characters.campaigns).to match_array campaigns
  end
end