class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
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
