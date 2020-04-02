class AddUserRefToOrderItemPerUser < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :OrderItemPerUser, :users, on_delete: :cascade
    add_foreign_key :OrderItemPerUser, :orders, on_delete: :cascade
  end
end
