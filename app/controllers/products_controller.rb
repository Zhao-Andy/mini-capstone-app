class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:sort] && params[:sort_order]
      @products = Product.order(params[:sort] => params[:sort_order])
    elsif params[:discount]
      @products = Product.where("price < ?", 2.00)
    end
    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
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
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
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

  def search
    @products = Product.where("LOWER(name) LIKE ?", "#{params[:search].downcase}")
    render 'index.html.erb'
  end
end
