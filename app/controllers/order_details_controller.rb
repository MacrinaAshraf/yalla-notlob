class OrderDetailsController
  before_action :authenticate_user!

  def create
    # get order_id
    user_id = current_user.id

  end
end