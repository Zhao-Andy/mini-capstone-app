class Order < ActiveRecord::Base
  has_many :carted_products
  has_many :products, through: :carted_products
  belongs_to :user

  validates :subtotal, :tax, :total, presence: true
  validates :subtotal, :tax, :total, numericality: true
  

  def calculate
    o_subtotal = 0
    o_tax = 0
    carted_products.each do |item|
      o_subtotal += item.quantity * item.product.price
      o_tax += item.quantity * item.product.tax
    end
    self.subtotal = o_subtotal
    self.tax = o_tax
    self.total = (o_subtotal + o_tax).round(2)
    save
  end
end
