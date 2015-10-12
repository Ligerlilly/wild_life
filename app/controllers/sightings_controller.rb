class SightingsController < ApplicationController
  before_action :find_sighting, except: [:create, :new, :index]
  before_action :find_species, except: [:index]

  def index
    if params[:date]
      @sightings = Sighting.where(date: params[:date])
    else
      @sightings = Sighting.all
    end
    render :index
  end

  def show
    render :show
  end

  def new
    @sighting = Sighting.new
    render :new
  end

  def create
    @sighting = @species.sightings.new(sighting_params)
    if @sighting.save
      redirect_to species_path(@species)
    else
      flash[:danger] = @sighting.errors.full_messages.first
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @sighting.update(sighting_params)
      redirect_to species_path(@sighting.species)
    else
      flash[:danger] = @sighting.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    @sighting.destroy
    redirect_to species_path(@species)
  end

private
  def sighting_params
    params.require(:sighting).permit(:lat, :long, :date, :region_id)
  end
  def find_sighting
    @sighting = Sighting.find(params[:id])
  end
  def find_species
    @species = Species.find(params[:species_id])
  end
end
