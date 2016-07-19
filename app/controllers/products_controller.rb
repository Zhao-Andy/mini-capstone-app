class ProductsController < ApplicationController
  def products
    @products = Product.all
  end

  def first_product
    @first = Product.find_by(id: 1)
  end

  def second_product
    @second = Product.find_by(id: 2)
  end
end
