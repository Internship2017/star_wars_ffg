class CareersController < ApplicationController
  before_action :set_career, except: [:index, :new, :create]

  def index
    @careers = Career.all
  end

  def show; end

  def new
    @career = Career.new
  end

  def create
    @career = Career.new(career_params)
    if @career.save
      redirect_to careers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @career.update(career_params)
      redirect_to careers_path, flash: { success: "Character successfully edited!" }
    else
      render :edit
    end
  end

  def destroy
    @career.destroy
  end

  private

  def set_career
    @career = Career.find(params[:id])
  end

  def career_params
    params.require(:career).permit(:name, :description, :free_ranks, :source_page, :source_book, career_skills: [])
  end
end
