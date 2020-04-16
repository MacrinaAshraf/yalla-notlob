class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 

  has_many :order_details
  has_many :orders, through: :order_details, dependent: :delete_all

  has_many :invited_users
  has_many :orders, through: :invited_users

  has_many :users, class_name: 'Friend', foreign_key: 'friend_id'

  has_many :friends, class_name: 'Friend', foreign_key: 'user_id'

  has_many :groups

end