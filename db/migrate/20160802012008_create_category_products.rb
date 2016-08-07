class CreateCategoryProducts < ActiveRecord::Migration
  def change
    create_table :category_products do |t|
      t.timestamps null: false
    end
    add_column :category_products, :category_id, :integer
    add_column :category_products, :product_id, :integer
  end
end
