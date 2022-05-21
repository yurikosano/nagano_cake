Rails.application.routes.draw do
  root to: "public/homes#top"
  get '/about' => "public/homes#about"
  get 'customers/my_page' => "public/customers#show"

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  namespace :public do
    get 'homes/about' => "homes#about"
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :index, :show]
    resource :customers, only: [:show, :edit, :update, :destory]
    resources :addresses, only: [:index, :edit, :update, :destroy, :create]
  end
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
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
