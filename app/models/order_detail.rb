class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum product_status: { product_impossible: 0, wait_product: 1, producting: 3, complete_product: 4 }
end
