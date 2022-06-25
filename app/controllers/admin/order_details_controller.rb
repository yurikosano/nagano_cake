class Admin::OrderDetailsController < ApplicationController
  def show
    @order = Order.all
    @order_details = OrderDetail.all
    @total = 0
    @ordered_item.each do |ordered_item|
      tol = ordered_detail.item.price * ordered_detail.item.amount
      @total += tol
    end
  end
