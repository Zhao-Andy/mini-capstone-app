class OrdersController < ApplicationController
  before_action :authenticate_user!
  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      @carted_products = @order.carted_products
    else
      redirect_to "/products"
    end
  end

  def create
    cart = current_user.carted_products.where(status: 'Carted')
    order = Order.create(
      user_id: current_user.id
    )
    cart.update_all(order_id: order.id, status: "Ordered")
    order.calculate
    flash[:success] = "Order ##{order.id} has been placed!"
    redirect_to "/orders/#{order.id}"
  end
end
