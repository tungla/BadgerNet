
Rails.application.routes.draw do
  devise_for :users, skip: :registration

  root 'home#index'

  # Home controller routes
  get 'home/index'

  # Permissions routes
  get 'permissions/index'
  post 'permissions/delete'

end
