class Order < ApplicationRecord
  has_many :order_details
  has_many :users, through: :order_details
  has_many :invited_users
  has_many :users, through: :invited_users
  # enum status: [ :waiting, :finished ]
  
  
end