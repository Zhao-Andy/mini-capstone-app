class DeleteSupplierIdFromSupplier < ActiveRecord::Migration
  def change
    remove_column :suppliers, :supplier_id
    remove_column :products, :product_id
  end
end
