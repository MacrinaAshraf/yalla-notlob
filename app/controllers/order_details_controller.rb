class OrderDetailsController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.find(params[:order_id])
    # details_params = params.require(:order_detail).permit(:item, :price, :amount, :comment)
    @order_detail = OrderDetail.new
    @order_detail.user_id = current_user.id
    @order_detail.amount = params[:order_detail][:amount]
    @order_detail.item = params[:order_detail][:item]
    @order_detail.price = params[:order_detail][:price]
    @order_detail.comment = params[:order_detail][:comment]
    @order_detail.order_id = @order.id
    @order_detail.save
    # @order_detail = @order.order_details.create({details_params, user_id: current_user.id})
    if @order_detail.persisted?
      redirect_to order_path(@order)
    end
  end

  def destroy
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.destroy
    redirect_to order_path(@order_detail.order_id)
  end
end