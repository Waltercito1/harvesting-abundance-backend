class ReviewsController < ApplicationController

  def index
    reviews = Review.all

    render json: ReviewSerializer.new(reviews)
  end

  def show
    review = Review.find(params[:id])
    render json: ReviewSerializer.new(review)
  end

  def create
    review = Review.new(review_params)

    if review.save
      render json: ReviewSerializer.new(review), status: :created, location: review
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      render json: ReviewSerializer.new(review)
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
  end

  private

    def review_params
      params.require(:review).permit(:title, :content, :harvest_site_id)
    end
end
