class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, expect[:top]
  def top
    @items = Item.where(sale_status: "販売可")
  end

  def about
  end
end
