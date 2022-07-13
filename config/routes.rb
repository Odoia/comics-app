Rails.application.routes.draw do
  get 'sessions/new'
  resources :comics

  get 'search' => 'comics#search'

  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create'
  root 'sessions#new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
