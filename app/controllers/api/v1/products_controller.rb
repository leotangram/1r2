class Api::V1::ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def create
    @product = product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  
end