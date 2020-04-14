class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :user

  self.table_name = 'order_items_per_user'
end