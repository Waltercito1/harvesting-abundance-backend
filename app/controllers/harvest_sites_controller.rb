class HarvestSitesController < ApplicationController
  before_action :set_harvest_site, only: [:show, :update, :destroy]

  # GET /harvest_sites
  def index
    @harvest_sites = HarvestSite.all

    render json: @harvest_sites
  end

  # GET /harvest_sites/1
  def show
    render json: @harvest_site
  end

  # POST /harvest_sites
  def create
    @harvest_site = HarvestSite.new(harvest_site_params)

    if @harvest_site.save
      render json: @harvest_site, status: :created, location: @harvest_site
    else
      render json: @harvest_site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /harvest_sites/1
  def update
    if @harvest_site.update(harvest_site_params)
      render json: @harvest_site
    else
      render json: @harvest_site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /harvest_sites/1
  def destroy
    @harvest_site.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_harvest_site
      @harvest_site = HarvestSite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def harvest_site_params
      params.require(:harvest_site).permit(:tree_id, :location_id)
    end
end
