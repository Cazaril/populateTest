class ReviewsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @review = @product.reviews.new(product_id: @product)

    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

end
