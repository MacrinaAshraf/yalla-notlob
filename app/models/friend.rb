class Friend < ApplicationRecord
  self.table_name = 'friends_users'
  # belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  # belongs_to :friend, foreign_key: 'friend_id', class_name: 'User'

  # before_create :owner
  # def owner
  #     self.user_id = current_user.id
  # end
end
