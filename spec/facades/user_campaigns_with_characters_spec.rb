require 'rails_helper'
require_relative '../../app/facades/user_campaigns_with_characters'

describe 'UserCampaignsWithCharacters' do

  it 'Should have respond to user' do
    u = FactoryGirl.build :user
    campaigns_characters = UserCampaignsWithCharacters.new(u)
    expect(campaigns_characters).to respond_to(:user)
  end

  it 'Should respond to characters' do
    u = FactoryGirl.create :user
    campaigns_characters = UserCampaignsWithCharacters.new(u)
    expect(campaigns_characters).to respond_to(:characters)
  end

  it 'Should respond to campaigns' do
    u = FactoryGirl.create :user
    campaigns_characters = UserCampaignsWithCharacters.new(u)
    expect(campaigns_characters).to respond_to(:campaigns)
  end
end