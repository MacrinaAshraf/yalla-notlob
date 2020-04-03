class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :order_details
  has_many :orders, through: :order_details, dependent: :delete_all

  has_many :user_involved_to_order
  has_many :orders, through: :user_involved_to_order

  has_and_belongs_to_many :users, class_name: 'Friend', foreign_key: 'users_id'

  has_and_belongs_to_many :friends, class_name: 'Friend', foreign_key: 'friend_id'

  has_many :groups, dependent: :delete_all



end
