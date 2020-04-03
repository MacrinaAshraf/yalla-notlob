class AddIdPrimaryToUserInvolved < ActiveRecord::Migration[6.0]
  def change
    add_column :UserInvolvedToOrder, :id, :primary_key
  end
end
