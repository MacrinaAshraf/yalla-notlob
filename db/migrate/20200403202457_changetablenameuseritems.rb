class Changetablenameuseritems < ActiveRecord::Migration[6.0]
  def change
    rename_table :OrderItemPerUser, :order_items_per_user
  end
end
