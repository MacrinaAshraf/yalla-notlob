class Order < ApplicationRecord
  has_many :order_details
  has_many :users, through: :order_details

  has_many :user_involved_to_order
  has_many :users, through: :user_involved_to_order
end
