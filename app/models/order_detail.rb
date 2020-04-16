class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :user

  validates :amount, :item, :comment, :price, :order_id, :user_id, presence: :true
  validates :price, :amount, numericality: true

  self.table_name = 'order_items_per_user'
end