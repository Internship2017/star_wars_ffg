class SpeciesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_species, only: [:edit, :show]

  def index
    @species = Species.all
  end

  def show
    @species = Species.find(params[:id])
  end	

  def new
    @species = Species.new
  end	

  def create
    @species = Species.new(species_params)
    if @species.save
      redirect_to @species
    else
      render :new
    end
  end

  def edit
    @species = Species.find(params[:id])
  end

  def update
    if @species.update(species_params)
      redirect_to @species, flash: { success: "The species has been updated!" }
    else
      render :edit
    end
  end

  def upload
    SpeciesUploader.new(params[:upload][:file]).run
    redirect_to species_index_path, flash: { success: "File uploaded" }
  end

  def destroy
    @species.destroy
  end

  private

  def set_species
    @species = Species.find(params[:id])
  end

  def species_params
    params.require(:species).permit(:id, :name, :description, :source_page, :source_book, :brawn, :agility, :intellect, :cunning, :willpower, :presence, :wound_threshold, :strain_threshold, :experience, :skill_name, :skill_start_rank, :skill_limit_rank)
  end
end
