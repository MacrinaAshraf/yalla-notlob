class Changetablenameuserinvolved < ActiveRecord::Migration[6.0]
  def change
    rename_table :UserInvolvedToOrder, :user_involved_to_order
  end
end
