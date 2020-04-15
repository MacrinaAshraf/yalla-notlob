class GroupUser < ApplicationRecord
  # belongs_to :user
  belongs_to :group

  self.table_name = 'groups_users'
end