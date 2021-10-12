class ProductsController < ApplicationController
  before_action :get_product, except: [:index]
  before_action :calculate_rating

  def index
    @product = Product.find(1)
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Review added"
      redirect_to action: 'index'
    else
    # flash.now[:error] = "To-do item update failed"
      redirect_to action: @product.reviews.new
    end
  end

  private
  def product_params
    params.require(:product).permit(
      :reviews_attributes => [
        :review, :rating
      ])
  end

  private
  def calculate_rating
    @product = Product.find(1)
    ratings = @product.reviews
                      .select{|review| not review.rating.nil?}
                      .flat_map(&:rating)
    @final_rating = (ratings.inject(0, :+)/@product.reviews.count).round
  end

  private
  def get_product
    @product = Product.find(params[:id])
  end
end
