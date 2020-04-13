class OrdersController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end
  def change_status
    @order = Order.find(params[:id])
    puts(@order)
    @order.status = "ready"
    @order.save
    redirect_to orders_path
  end  
    
  # def show
  # end

  # GET /orders/new
  def new
    @order = Order.new
    @friends = Friend.new
  end

  

  # GET /orders/1/edit
  # def edit
  # end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.status = "waiting"
    #Current User Id
    @order.user_id = 1
    @order.menu_path = params[:order][:menu_path].original_filename
    uploaded_io = params[:order][:menu_path]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @order.save()
    redirect_to action: :index

    # respond_to do |format|
    #   if @order.save
    #     puts(@order)
    #     format.html { redirect_to @order, notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # def destroy
  #   @order.destroy
  #   respond_to do |format|
  #     format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   Use callbacks to share common setup or constraints between actions.
  #   def set_order
  #     @order = Order.find(params[:id])
  #   end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {})
    end
 end



 def freind_params
  params.require(:friend).permit(:friend_id)
end