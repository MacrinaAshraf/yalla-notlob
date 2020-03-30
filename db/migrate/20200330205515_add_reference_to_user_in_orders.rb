class AddReferenceToUserInOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :user, foreign_key: { on_delete: :cascade }
  end
end
