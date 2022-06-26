class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters

   # サインアップ時にnameのストロングパラメータを追加
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email])

 end
end
