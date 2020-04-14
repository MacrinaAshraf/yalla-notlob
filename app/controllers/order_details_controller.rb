class OrderDetailsController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.find(params[:order_id])
    # details_params = params.require(:order_detail).permit(:item, :price, :amount, :comment)
    p params
    @order_detail = OrderDetail.new
    @order_detail.user_id = params[:user_id]
    @order_detail.amount = params[:order_detail][:amount]
    @order_detail.item = params[:order_detail][:item]
    @order_detail.price = params[:order_detail][:price]
    @order_detail.comment = params[:order_detail][:comment]
    @order_detail.order_id = @order.id
    @order_detail.save
    # = @order.order_details.create(details_params)
    if @order_detail.persisted?
      redirect_to order_path(@order)
    else
      p "ERROR"
    end
  end

  details

end