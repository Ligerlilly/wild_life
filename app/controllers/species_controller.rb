class SpeciesController < ApplicationController
  def index
    @species = Species.all
    render :index
  end
end
