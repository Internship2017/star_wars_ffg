class SpeciesController < ApplicationController
before_action :authenticate_user!
before_action :set_specie, except: [:index, :new, :create, :upload]

	def index
		@species = Specie.all
	end

	def show; end	

	def new
		@specie = Specie.new
	end	

	def create
		@specie = Specie.new(specie_params)
		if @specie.save
			redirect_to species_path
		else
			render :new
		end
	end

	def edit; end
	
	def update
		if @specie.update(specie_params)
			redirect_to species_path, flash: { success: "Specie has been updated!" }
		else
			render :edit
		end
	end

	def upload
	end

	private

	def set_specie
		@specie = Specie.find(params[:id])
	end

	def specie_params
		params.require(:specie).permit(:name, :description, :source_page, :source_book, :brawn, :agility, :intellect, :cunning, :willpower, :presence, :wound_threshold, :strain_threshold, :experience, :skill_name, :skill_start_rank, :skill_limit_rank)
	end
end
