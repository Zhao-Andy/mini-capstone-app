class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    @product = Product.find_by(id: params[:product_id])
    @order = Order.new(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id],
      subtotal: (@product.price * params[:quantity].to_i),
      tax: (@product.tax * params[:quantity].to_i),
      total: (@product.total * params[:quantity].to_i)
    )
    @order.save
    flash[:success] = "Success!"
    redirect_to "/orders/#{@order.id}"
  end
end
