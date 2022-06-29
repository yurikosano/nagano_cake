class Public::CustomersController < ApplicationController
 #before_action :ensure_enabled_product, only: [:show, :update]
  def show
    @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def update
   @customer = Customer.find(params[:id])
   if customer.update(customer_params)
    flash[:notice] = "編集しました。"
    redirect_to customers_my_page_path
   else
    flash[:danger] = "編集されませんでした。"
    render :edit
   end
  end

  def unsubscribe
   @customer = current_customer
  end

  def switch
   @customer = current_customer
   if @customer.update(is_active: false)
   sign_out current_customer
   end
   redirect_to root_path
  end


  private
  def customer_params
   params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_code, :address, :is_active)
  end

end
