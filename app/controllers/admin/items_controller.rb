class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "商品を登録しました"
      redirect_to admin_item_path(@item.id)
    else
      flash[:danger] = "必要な情報を入力してください"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "商品情報を更新しました"
      redirect_to admin_item_path(@item.id)
    else
      flash[:danger] = "商品情報を入力してください"
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :introduction, :genre_id, :image, :is_active)
  end
end
