class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def order_subtotal
    product.price * quantity
  end

  def order_tax
    product.tax * quantity
  end

  def order_total
    product.total * quantity
  end
end
