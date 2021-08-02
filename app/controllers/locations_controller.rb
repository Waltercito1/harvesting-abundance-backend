class LocationsController < ApplicationController

  def index
    locations = Location.all

    render json: locations
  end
  
  def show
    location = Location.find(params[:id])
    render json: location
  end

  def create
    location = Location.new(location_params)

    if location.save
      render json: location, status: :created, location: location
    else
      render json: location.errors, status: :unprocessable_entity
    end
  end

  def update
    location = Location.find(params[:id])
    if location.update(location_params)
      render json: location
    else
      render json: location.errors, status: :unprocessable_entity
    end
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
  end

  private
  
    def location_params
      params.require(:location).permit(:latitude, :longitude)
    end
end
