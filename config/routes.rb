Rails.application.routes.draw do

scope module: :public do
  root to: 'homes#top'
  get 'homes/about' => "homes#about"
  get '/customers/my_page' => 'customers#show'
  post '/orders/confirm' => 'orders#confirm', as: 'orders_confirm'
  get '/orders/create_order' => 'orders#create_order'
  post '/orders/create_shipping_address' => 'orders#create_shipping_address'
  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer'
  patch '/customers/:id/withdrow' => 'customers#switch', as: 'withdrow_switch_customer'
  resources :items, only: [:index, :show]
  resources :orders, only: [:new, :index, :show, :confirm, :complete]
  resource :customers, only: [:show, :edit, :update, :withdrow, :unsubscribe]
  resources :addresses, only: [:index, :edit, :update, :destroy, :create]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete '/cart_items' => 'cart_items#destroy_all'

end

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: 'items#index'
  resources :genres, only: [:index, :create, :edit, :update]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :customers, only: [:index, :show, :create, :edit, :update]
  resources :orders, only: [:index, :update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
