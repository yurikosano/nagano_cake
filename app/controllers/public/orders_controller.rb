class Public::OrdersController < ApplicationController
  def new
    @addresses = current_customer.addresses
    @address = Address.new
    @order = Order.new
  end

  def index
    @orders = Order.where(customer_id: current_customer)
  end

  def create
    @order = current_customer.orders.build(order_params)
    #binding.irb
    if params[:order][:payment_method] && params[:order][:shipping_adress]
      @order.total_payment = calculate(current_customer)
      @order.order_status = 0
      @order.save
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.purchase_price = cart_item.item.price
        @order_detail.amount = cart_item.amount
        @order_detail.product_status = 0
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      session.delete(:address)
      session.delete(:payment)
      redirect_to orders_complete_path
    else
      flash[:order_new] = "支払い方法と配送先を選択してください"
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def confirm
    @order = current_customer.orders.new
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
     if params[:order][:select] == "my_address"
      @order.shipping_post_code = current_customer.postal_code
      @order.shipping_adress = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
     elsif params[:order][:select] == "select_address"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_post_code = @address.potal_code
      @order.shipping_adress = @address.address
      @order.shipping_name = @address.name
     elsif params[:order][:select] == "new_address"
      @order.shipping_post_code = params[:order][:shipping_post_code]
      @order.shipping_adress = params[:order][:shipping_adress]
      @order.shipping_name = params[:order][:shipping_name]
     end
  end


  def create_shipping_address
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    @shipping_address.save
    redirect_to new_order_path
  end


  def create_order
    @order = Order.new
    @order.customer_id = current_customer.id
    #@order.address = session[:address]
    #@order.payment = session[:payment]
    @order.total_payment = calculate(current_customer)
    @order.order_status = 0
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.purchase_price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.product_status = 0
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    session.delete(:address)
    session.delete(:payment)
    redirect_to orders_complete_path
  end

  private
   def shipping_address_params
     params.require(:shipping_address).permit(:customer_id,:last_name, :first_name, :post_code, :address)
   end
   def order_params
     params.require(:order).permit(:customer_id, :shipping_post_code, :shipping_adress, :shipping_name, :postage, :total_payment, :payment_method, :order_status)
   end

   def calculate(user)
     total_price = 0
     user.cart_items.each do |cart_item|
       total_price += cart_item.amount * cart_item.item.price
     end
     return (total_price * 1.1).floor
   end
end
