class RenameFriendsToFriendsUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :friends, :friends_users
  end
end
