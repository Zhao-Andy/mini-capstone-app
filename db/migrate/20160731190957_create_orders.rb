class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :total

      t.timestamps null: false
    end
  end
end
