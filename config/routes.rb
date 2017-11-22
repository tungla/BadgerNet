
Rails.application.routes.draw do
  devise_for :users, skip: :registration

  root 'home#index'

  # Contacts controller
  delete 'contacts/destroy'
  post '/contacts', to: 'contacts#index'
  post 'contacts/action'
  resources :contacts, :path => 'contacts' #gives CRUD routes

  # Home controller routes
  get 'home/index'


  # get 'announcement/index'
  resources :announcement, :path => 'announcement' #gives CRUD routes

  # scheulde
  get '/schedule', to: 'schedule#index'

  # Permissions routes
  get '/permissions', to: 'permissions#index'
  delete 'permissions/destroy'



  #documents
  get '/documents' => 'documents#index'




end
