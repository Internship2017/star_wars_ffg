class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: [:edit, :update, :show, :destroy]

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
    @characters = current_user.characters
  end

  def show
    @campaign = current_user.characters.find_by(id: params[:id])
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
