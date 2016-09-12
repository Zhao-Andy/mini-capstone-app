class CartedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :user

  validates :user_id, :product_id, :quantity, :status, presence: true
  validates :user_id, :product_id, :quantity, :order_id, numericality: {only_integer: true }
end
