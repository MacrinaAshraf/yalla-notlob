module OrderDetailsHelper
  def detail_current_user(detail)
    if detail.user_id == current_user.id
      'You'
    else
      detail.user.name
    end
  end

  def item_belong_to_current_user(detail)
    detail.user_id == current_user.id
  end

  def user_is_invited?(order)
    user_ids = order.invited_users.select('user_id')
    p user_ids
    user_ids.each do |user|
      if user.user_id == current_user.id
        p "HELLO"
        return true
      end
    end
    false
  end
end