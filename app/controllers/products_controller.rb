class ProductsController < ApplicationController

  layout 'profile'

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to profile_products_path(1), notice: "Product added!"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to profile_products_path(1), notice: "Product updated!"
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      redirect_to profile_products_path(1), notice: "Product has been removed from database."
    end
  end

end
