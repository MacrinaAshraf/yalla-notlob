class PagesController < ApplicationController
  before_action :authenticate_user!


  def index
    if user_signed_in?
      @currentUser = current_user.name
      @orders=[]
      @ordersN= Order.where(user_id: current_user.id )
      @ordersN.each do |order|
        if order.status == "waiting"
            @orders.push("#{order.meal.to_s} on #{order.created_at.to_s}")
          # @orders.push(""+order.meal+" on "+ order.created_at.strftime("%d-%m-%Y"))
        end 
        # @orders.push(order.restaurant)
      end


      @friend_number = current_user.friends
      @friends = []
      @friendorders=[]
      @friend_number.each do |fri|
        @friendDat = User.find(fri.friend_id)
        @ordrs= Order.where(user_id: @friendDat.id )
        @ordrs.each do |order|
          if order.status == "waiting"
              @friendorders.push("friendName":"#{@friendDat.name}","order":"#{order.meal.to_s} on #{order.created_at.to_s}")
          end 
        end
      end      

      # redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

  def errorPage

  end
end
