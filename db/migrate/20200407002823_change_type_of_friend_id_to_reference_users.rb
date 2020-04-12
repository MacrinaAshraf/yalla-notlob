class ChangeTypeOfFriendIdToReferenceUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :friends_users, :friend_id, :bigint
  end
end
