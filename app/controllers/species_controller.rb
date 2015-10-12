class SpeciesController < ApplicationController
  before_action :find_species, except: [:create, :index, :new]
  def index
    @species = Species.all
    render :index
  end

  def new
    @species = Species.new
    render 'new'
  end

  def create
    @species = Species.new(species_params)
    if @species.save
      redirect_to species_index_path
    else
      flash[:danger] = @species.errors.full_messages.first
      render :new
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @species.update(species_params)
      redirect_to species_path(@species)
    else
      flash[:danger] = @species.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    @species.destroy
    redirect_to species_index_path
  end

private

  def find_species
    @species = Species.find(params[:id])
  end

  def species_params
    params.require(:species).permit(:name)
  end
end
