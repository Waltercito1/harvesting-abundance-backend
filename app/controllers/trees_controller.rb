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
# byebug
    tree = Tree.new(name: params[:name], description: params[:description])
    tree.main_image.attach(params[:main_image])
    tree.save

      location = Location.new(latitude: params[:latitude], longitude: params[:longitude])
      
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
    byebug
    tree = Tree.find(params[:id])
    tree.destroy
  end

  private

    def tree_params
      params.permit(:id, :name, :description, :latitude, :longitude, :main_image)
    end
end
