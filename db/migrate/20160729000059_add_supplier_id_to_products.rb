class AddSupplierIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :supplier_id, :integer
    add_column :products, :product_id, :integer
    add_column :suppliers, :product_id, :integer
  end
end
