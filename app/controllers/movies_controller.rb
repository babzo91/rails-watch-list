class MoviesController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @plant = Plant.new(plant_params)
    @plant.garden = @garden
    if @plant.save
      redirect_to garden_path(@garden)
    else
      @plants = @garden.plants
      render "gardens/show", status: :unprocessable_entity
    end
  end
end
