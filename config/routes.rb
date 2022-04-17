Rails.application.routes.draw do
  root to: "public/homes#top"
  
  devise_for :customers, :controllers => {
    registrations: "public/registrations",
    sessions: 'public/sessions'
}
  namespace :public do
    get 'homes/about' => "homes#about"
    get 'items/index'
    get 'items/show'
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
  end
devise_for :admins, :controllers => {
    registrations: "admins/registrations",
    sessions: "admins/sessions",
}
namespace :admin do
   root to: 'homes#top'
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :customers, only: [:index, :show, :create, :edit, :update]
   resources :orders, only: [:index, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
