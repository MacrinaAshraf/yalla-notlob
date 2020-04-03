class AddIdPrimaryToUserItemesPerOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :OrderItemPerUser, :id, :primary_key
  end
end
