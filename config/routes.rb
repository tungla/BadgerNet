Rails.application.routes.draw do
  get 'permissions/index'

  post 'permissions/delete'

  devise_for :users, skip: :registration
  root 'home#index'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
