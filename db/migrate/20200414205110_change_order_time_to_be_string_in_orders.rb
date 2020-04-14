class ChangeOrderTimeToBeStringInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :order_time, :string
  end
end
