class ReviewsController < ApplicationController
  before_action :get_product
  def index
    @reviews = @product.reviews
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = @product.reviews.new
  end

  def create
    @review = @product.reviews.new(review_params)
    @review.rating = params["rating"]
    if @review.save
      redirect_to @product
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:review, :rating)
  end


  private
  def get_product
    @product = Product.find(params[:product_id])
  end
end
