class Public::CustomersController < ApplicationController
 before_action :ensure_enabled_product, only: [:show, :update]
  def show
    @customer = current_customer
  end
end
