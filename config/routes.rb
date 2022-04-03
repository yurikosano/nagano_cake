Rails.application.routes.draw do
  namespace :admin do
   root to: "homes#top"
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :customers, only: [:index, :show, :create, :edit, :update]
  end
  devise_for :admin
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
