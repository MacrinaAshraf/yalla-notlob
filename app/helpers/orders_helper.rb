module OrdersHelper
  def order_belong_to_current_user(order)
    order.user_id == current_user.id
  end
end
