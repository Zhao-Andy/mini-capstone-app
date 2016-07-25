class Product < ActiveRecord::Base
  def sale_message
    if price.to_i < 2
      @message = "Discount Item!"
    else
      @message = "Not on Sale!"
    end
  end

  def tax
    (price.to_f * 0.09)
  end

  def total
    (price.to_f + tax).round(2)
  end
end
