class UpdateToProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, "numeric USING CAST(price AS numeric)", precision: 10, scale: 2
    change_column :products, :desc, :text
  end
end
