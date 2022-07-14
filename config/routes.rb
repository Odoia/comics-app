Rails.application.routes.draw do
  get 'sessions/new'
  resources :comics, only: [:index, :search]

  post 'update_favorite' => 'users#update_favorite'


  get 'search' => 'comics#search'

  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create'
  root 'sessions#new'
end
