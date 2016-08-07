class User < ActiveRecord::Base
  has_many :orders
  has_many :carted_products
  has_many :products, through: :orders

  has_secure_password
end
