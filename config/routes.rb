Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'home/index'
  #get 'announcement/index'
  resources :announcement, :path => 'announcement' #gives CRUD routes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end