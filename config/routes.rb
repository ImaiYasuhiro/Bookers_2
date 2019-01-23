Rails.application.routes.draw do
  get 'homes/show'
  get 'homes/index'
  get 'homes/new'
  get 'homes/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root 'homes#show'

  resources :users

end