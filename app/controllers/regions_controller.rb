class RegionsController < ApplicationController

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
    render :new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      redirect_to regions_path
    else
      flash[:danger] = @region.errors.full_messages.first
      render :new
    end
  end

  def show
    @region = Region.find(params[:id])
    render :show
  end


private

  def region_params
    params.require(:region).permit(:name)
  end

end
