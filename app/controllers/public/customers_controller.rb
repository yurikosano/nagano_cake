class Public::CustomersController < ApplicationController
 #before_action :ensure_enabled_product, only: [:show, :update]
  def show
    @customer = current_customer
  end
  
  def edit
   @customer = Customer.find(params[:id])
  end
  
  def update
   @customer = Customer.find(params[:id])
   if customer.update(customer_params)
    flash[:notice] = "編集しました。"
    redirect_to customers_my_page
   else
    flash[:danger] = "編集されませんでした。"
    render :edit_public_customer
   end
  end
  
  def destory
   customer = Customer.find(params[:id])
   customer.destory
   flash[:notice] = "アカウントを削除しました"
   redirect_to root_path
  end
  
  
  private
  def customer_params
   params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_code, :address)
  end
  
end
