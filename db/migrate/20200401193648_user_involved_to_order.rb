class UserInvolvedToOrder < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :orders, table_name: :UserInvolvedToOrder do |t|
      t.integer :joined, null: false
      t.timestamps
    end
  end
end
