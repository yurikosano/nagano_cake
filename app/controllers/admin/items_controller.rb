class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
      flash[:success] = "商品を登録しました"
    else
      flash[:danger] = "必要な情報を入力してください"
      render new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :introduction, :genre_id, :image)
  end
end
