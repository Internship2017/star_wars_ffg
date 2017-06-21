class CampaignsController < ApplicationController
  def new
		@campaign = Campaign.new
  end

  def create
		@campaign = Campaign.new(campaign_params)

			if @campaign.save
					redirect_to @campaign
				else
					render 'new'
			end
	end

	private
		def campaign_params
			params.require(:campaign).permit(:name)
		end
end
