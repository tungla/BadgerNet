Rails.application.routes.draw do
  # Devise routes setup
  devise_for :users, skip: :registration, controllers: {
    invitations: 'invitations'
  }

  root 'home#index'
  get 'home/index' # Home (Main Index)

  # Announcements
  resources :announcement, :path => 'announcement'

  # Contacts (teams)
  delete 'contacts/destroy'
  resources :contacts, path: 'contacts'

  # Documents
  resources :documents, path: 'documents'

  # Schedule
  get '/schedule', to: 'schedule#index'

  # Permissions
  resources :permissions, path: 'permissions'

  #settings
  resources :settings, path: 'settings'
end
