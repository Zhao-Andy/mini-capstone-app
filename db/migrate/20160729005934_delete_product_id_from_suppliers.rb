class DeleteProductIdFromSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :product_id
  end
end
