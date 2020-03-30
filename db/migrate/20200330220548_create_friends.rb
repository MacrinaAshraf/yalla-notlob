class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :users, { foreign_key: :cascade }
      t.integer :friend_id, null: false
      t.timestamps
    end
  end
end
