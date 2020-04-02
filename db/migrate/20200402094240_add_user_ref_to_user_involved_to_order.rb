class AddUserRefToUserInvolvedToOrder < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :UserInvolvedToOrder, :users, on_delete: :cascade
    add_foreign_key :UserInvolvedToOrder, :orders, on_delete: :cascade
  end
end
