class InvitedUser < ApplicationRecord
  belongs_to :user
  belongs_to :order

  self.table_name = 'user_involved_to_order'
end