class OrderItemPerUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :x, table_name: :OrderItemPerUser do |t|
      t.string :item, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.string :comment, null: false
      t.timestamps
    end
  end
end
