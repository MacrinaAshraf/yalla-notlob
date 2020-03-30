class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :order_time, null: false
      t.string :restaurant, null: false
      t.string :menu_path, null: false
      t.integer :status, null: false
    end
  end
end
