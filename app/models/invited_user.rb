class InvitedUser < ApplicationRecord
  belongs_to :user
  belongs_to :order

  self.table_name = 'UserInvolvedToOrder'
end