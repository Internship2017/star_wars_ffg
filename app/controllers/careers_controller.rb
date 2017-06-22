class CareersController < ApplicationController
  def index
    @careers = Career.all
  end

  def show
    @career = Career.find(params[:id])
  end

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

  def edit
    @career = Career.find(params[:id])
  end

  def update
    @career = Career.find(params[:id])
    if @career.update(career_params)
      redirect_to careers_path
    else
      render :edit
    end
  end

  def destroy
    @career = Career.find(params[:id])
    @career.destroy
  end

  private

  def career_params
    params.require(:career).permit(:name, :description, :free_ranks, :source_page, :source_book, career_skills: [])
  end
end
