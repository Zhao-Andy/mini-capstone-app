class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      desc: params[:desc]
    )
    @product.save
    flash[:success] = "#{@product.name} was successfully created!"
    redirect_to "/products/#{@product.id}"
  end

  def new
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      desc: params[:desc]
    )
    flash[:success] = "#{@product.name} was successfully updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "#{@product.name} was successfully deleted!"
    redirect_to "/products"
  end
end
