class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :user

  self.table_name = 'OrderItemPerUser'
end