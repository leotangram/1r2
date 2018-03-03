class Api::V1::ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end  
  
  def create
    product = Product.new(products_params)
    if product.save
      render json: @product, status: 201
    else
      render json: { errors: product.errors }, status: 422
    end
  end
  
  def update
    @product = Product.find(params[:id])
    if(products_params[:name].present? && products_params[:price].present?)
      @product.update(products_params)
      render json: @product, status: 200
    else
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      render json: {errors:"Error 422"}, status: 422
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end
  
  private
  def products_params
    params.require(:product).permit(:name, :price)
  end
end