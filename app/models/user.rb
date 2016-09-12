class User < ActiveRecord::Base
  has_many :orders
  has_many :carted_products
  has_many :products, through: :orders

  validates :name, :email, :password_digest, presence: true

  has_secure_password
end
