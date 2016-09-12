class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = current_user.carted_products.where(status: "Carted")
    redirect_to '/products' if @cart.empty?
  end

  def create
    cart = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "Carted"
    )
    cart.save
    flash[:success] = "Added to cart!"
    redirect_to "/cart"
  end

  def destroy
    cart = CartedProduct.find_by(id: params[:id])
    cart.update(status: 'Removed')
    session[:cart_count] = nil
    flash[:success] = "#{cart.product.name} was removed!"
    redirect_to "/cart"
  end
end
