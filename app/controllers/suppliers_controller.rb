class SuppliersController < ApplicationController
  def create
    @supplier = Supplier.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      desc: params[:desc]
    )
    @supplier.save
    flash[:success] = "#{@supplier.name} was successfully created!"
    redirect_to "/suppliers/#{@supplier.id}"
  end
end
