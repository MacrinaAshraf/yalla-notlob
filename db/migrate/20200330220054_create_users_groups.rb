class CreateUsersGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :users_groups do |t|
      t.references :users, { foreign_key: :cascade }
      t.references :groups, { foreign_key: :cascade }
      t.timestamps
    end
  end
end
