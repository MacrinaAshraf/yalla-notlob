class Friend < ApplicationRecord
  self.table_name = 'friends_users'
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  belongs_to :friend, foreign_key: 'friend_id', class_name: 'User'

  after_commit :create_notifications, on: :create


  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'notify'
      notification.actor = self.user
      notification.user = self.friend
      notification.target = self
      notification.second_target = self.user
    end
  end



end
