Rails.application.routes.draw do
  devise_for :users
  root  "groups#index"
  resources :groups, only: [:new, :create, :edit]
  resources :messages, only: [:index]
end
