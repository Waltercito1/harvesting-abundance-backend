class TreesController < ApplicationController

  def index
    trees = Tree.all

    render json: TreeSerializer.new(trees)
  end

  def show
    tree = Tree.find(params[:id])
    # options = {
    #   include: [:harvest_sites]
    # }
    render json: TreeSerializer.new(tree)
  end

  def create
    # logger.info(params)
    tree = Tree.new(name: params[:tree][:name], description: params[:tree][:description])
    tree.save

      location = Location.new(latitude: params[:tree][:locations_attributes][:latitude], longitude: params[:tree][:locations_attributes][:longitude])
      
      if location.save
        harvest_site = HarvestSite.new(tree_id: tree.id, location_id: location.id, user_id: current_user.id)

        if harvest_site.save
        render json: TreeSerializer.new(tree), status: :created, location: tree
      end
    else
      render json: tree.errors, status: :unprocessable_entity
    end
  end

  def update
    tree = Tree.find(params[:id])
    if tree.update(tree_params)
      render json: TreeSerializer.new(tree)
    else
      render json: tree.errors, status: :unprocessable_entity
    end
  end

  def destroy
    tree = Tree.find(params[:id])
    tree.destroy
  end

  private

    def tree_params
      params.require(:tree).permit(:name, :description, locations_attributes: [:latitude, :longitude])
    end
end
