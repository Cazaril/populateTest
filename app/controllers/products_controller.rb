class ProductsController < ApplicationController
  def index
    @product = Product.find(1)
  end

  def show
    @review = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to action: "index"
    end
  end

  private
  def product_params
    params.require(:product).permit(
      :reviews_attributes => [
        :review, :rating
      ])
  end
end
