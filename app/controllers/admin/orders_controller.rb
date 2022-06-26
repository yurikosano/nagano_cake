class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
    @order_details.each do |order_detail|
      tol = order_detail.purchase_price * order_detail.amount
      @total += tol
    end
  end

 private
 def order_params
   params.require(:order).permit(:shipping_adress, :shipping_post_code, :shipping_name, :payment_method)
 end
end
