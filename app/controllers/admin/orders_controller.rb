class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order = Order.find(params[:id])
  end

  def show
  end
  
  private
  def params_order
end
