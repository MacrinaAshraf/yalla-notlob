class AddRefToUserFromFriendIdInFriends < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :friends_users, :users, column: :friend_id
  end
end
