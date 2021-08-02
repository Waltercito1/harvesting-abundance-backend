class HarvestSitesController < ApplicationController

  def index
    harvest_sites = HarvestSite.all

    render json: HarvestSiteSerializer.new(harvest_sites)
  end

  def show
    harvest_site = HarvestSite.find(params[:id])
    options = {
      include: [:tree, :location]
    }
    render json: HarvestSiteSerializer.new(harvest_site, options)
  end

  def create
    harvest_site = HarvestSite.new(harvest_site_params)

    if harvest_site.save
      #render json: harvest_site, status: :created, location: harvest_site
      render json: HarvestSiteSerializer.new(harvest_site)
    else
      render json: harvest_site.errors, status: :unprocessable_entity
    end
  end

  def update
    harvest_site = HarvestSite.find(params[:id])
    if harvest_site.update(harvest_site_params)
      render json: HarvestSiteSerializer.new(harvest_site)
    else
      render json: harvest_site.errors, status: :unprocessable_entity
    end
  end

  def destroy
    harvest_site = HarvestSite.find(params[:id])
    harvest_site.destroy
  end

  private

    def harvest_site_params
      params.require(:harvest_site).permit(:tree_id, :location_id)
    end
end
