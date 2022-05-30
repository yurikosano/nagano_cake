class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  def top
    @items = Item.where(is_active: true)
  end

  def about
  end
end
