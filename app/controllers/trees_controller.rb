class TreesController < ApplicationController

  def index
    trees = Tree.all

    render json: trees
  end

  def show
    tree = Tree.find(params[:id])
    options = {
      include: [:harvest_sites]
    }
    render json: TreeSerializer.new(tree, options)
  end

  def create
    tree = Tree.new(tree_params)

    if tree.save
      render json: tree, status: :created, location: tree
    else
      render json: tree.errors, status: :unprocessable_entity
    end
  end

  def update
    tree = Tree.find(params[:id])
    if tree.update(tree_params)
      render json: tree
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
      params.require(:tree).permit(:type, :description)
    end
end
