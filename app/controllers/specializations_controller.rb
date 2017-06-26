class SpecializationsController < ApplicationController
  before_action :set_specialization, except: [:index, :new, :create]

  def index
    @specializations = Specialization.all
  end

  def show; end

  def new
    @specialization = Specialization.new
  end

  def create
    @specialization = Specialization.new(specialization_params)
    if @specialization.save
      redirect_to specializations_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @specialization.update(specialization_params)
      redirect_to specializations_path, flash: { success: "Specialization successfully edited!" }
    else
      render :edit
    end
  end

  def destroy
    @specialization.destroy
  end

  private

  def set_specialization
    @specialization = Specialization.find(params[:id])
  end

  def specialization_params
    params.require(:specialization).permit(:name, :career_id, :description, :source_page, :source_book, career_skills: [])
  end
end
