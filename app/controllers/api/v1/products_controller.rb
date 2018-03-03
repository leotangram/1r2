class Api::V1::ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end  

  def create
    product = Product.new(products_params)
    if product.save
      render json: @product, status: 422
    else
      render json: { errors: product.errors }, status: 201
    end
  end

  private
  
  def products_params
    params.require(:product).permit(:name, :price)
  end
end