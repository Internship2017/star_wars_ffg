class TalentsController < ApplicationController
  before_action :set_talent, except: [:index, :new, :create, :upload]

  def index
    @talents = Talent.all
  end

  def show; end

  def new
    @talent = Talent.new
  end

  def create
    @talent = Talent.new(talent_params)
    if @talent.save
      redirect_to talents_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @talent.update(talent_params)
      redirect_to talents_path, flash: { success: "talent successfully edited!" }
    else
      render :edit
    end
  end

  def destroy
    @talent.destroy
    redirect_to talents_path
  end

  def upload
    Talent.upload(params[:upload][:file])
    redirect_to talents_path, flash: { success: "File uploaded" }
  end

  private

  def set_talent
    @talent = Talent.find(params[:id])
  end

  def talent_params
    params.require(:talent).permit(:name, :description, :activation_value, :sources, :ranked, sources_attributes: [:id, :page, :book, :_destroy])
  end
end
