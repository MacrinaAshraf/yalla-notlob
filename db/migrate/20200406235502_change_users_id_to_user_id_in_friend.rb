class ChangeUsersIdToUserIdInFriend < ActiveRecord::Migration[6.0]
  def change
    rename_column :friends, :users_id, :user_id
  end
end
