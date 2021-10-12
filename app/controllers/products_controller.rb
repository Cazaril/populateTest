class ProductsController < ApplicationController
  before_action :get_product, except: [:index]

  def index
    @product = Product.find(1)
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      @product.calculate_rating
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
  def get_product
    @product = Product.find(params[:id])
  end
end
