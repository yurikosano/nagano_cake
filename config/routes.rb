Rails.application.routes.draw do
  namespace :admin do
   resources :genres, only: [:index, :edit]
  end
  devise_for :admin
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
