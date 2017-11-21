
Rails.application.routes.draw do
  devise_for :users, skip: :registration, controllers: {
    invitations: 'invitations'
  }

  root 'home#index'

  # Contacts controller
  get '/contacts',to:'contacts#index'

  # Home controller routes
  get 'home/index'


  # get 'announcement/index'
  resources :announcement, :path => 'announcement' #gives CRUD routes

  # scheulde
  get '/schedule', to: 'schedule#index'
  post '/schedule', to: 'schedule#create_event'
  delete '/schedule', to: 'schedule#destroy_event'

  # Permissions routes
  resources :permissions, path: 'permissions'


  #documents
  get '/documents' => 'documents#index'

end
