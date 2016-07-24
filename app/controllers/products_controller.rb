class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def create
    @create = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      desc: params[:desc]
    )
    @create.save
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
    render 'update.html.erb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render "destroy.html.erb"
  end
end
