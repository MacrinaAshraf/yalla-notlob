module InvitedUsersHelper
  def get_user_name(user)
    User.find(user.user_id).name
  end

end

