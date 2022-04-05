class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_post_code
      t.string :shipping_adress
      t.string :shipping_name
      t.integer :postage
      t.integer :total_payment
      t.integer :payment_method
      t.integer :order_status
      t.timestamps
    end
  end
end
