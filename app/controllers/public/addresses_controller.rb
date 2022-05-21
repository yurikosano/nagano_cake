class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    if address.save
      flash[:notice] = "配送先を登録しました"
      redirect_to public_addresses_path
    else
      flash[:dander] = "配送先が登録できませんでした"
      render public_addresses_path
    end
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if address.update(address_params)
      flash[:notice] = "編集しました"
      redirect_to public_addresses_path
    else
      flash[:dander] = "編集できませんでした"
      render edit_public_address_path
    end
  end
  
  def destory
    @address = Address.find(params[:id])
    address.destory
    redirect_to public_addresses_path
  end
  
private
  def address_params
    params.require(:address).permit(:customer_id, :name, :potal_code, :address)
  end

end
