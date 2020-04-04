class RenameUsersGroupsToGroupsUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_groups, :groups_users
  end
end
