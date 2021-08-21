class UsersController < ApplicationController

  def index
    users = User.all

    render json: UserSerializer.new(users)
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user), status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: UserSerializer.new(user)
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password_digest)
    end
end
