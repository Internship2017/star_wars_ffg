class CampaignsController < ApplicationController
  before_action :authenticate_user!

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      redirect_to characters_path
    else
      render 'new'
    end
  end

  def index
    @campaigns = []
    characters = current_user.characters
    characters.each do |character|
      campaign_info = character.campaign
      @campaigns << { id: campaign_info.id, campaign: campaign_info.name, character: character.name }
    end
  end

  def show
  	@campaign = Campaign.find(params[:id])
	end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to characters_path
    else
      render :edit
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name)
  end

end
