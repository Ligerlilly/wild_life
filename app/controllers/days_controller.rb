class DaysController < ApplicationController
  def show
    @day = Day.find(params[:id])
    render :show
  end
end
