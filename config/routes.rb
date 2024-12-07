Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "/" #set this to Items#index
  resources :users
  resources :items
  resources :images

  resources :user_items, only: [:index, :show, :create, :update]

  root 'items#index'
end
