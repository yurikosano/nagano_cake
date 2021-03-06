class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save!
      flash[:notice] = "配送先を登録しました"
      redirect_to addresses_path
    else
      flash[:dander] = "配送先が登録できませんでした"
      @addresses = Address.all
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "編集しました"
      redirect_to addresses_path
    else
      flash[:dander] = "編集できませんでした"
      render edit_address_path
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

private
  def address_params
    params.require(:address).permit(:customer_id, :name, :potal_code, :address)
  end

end
