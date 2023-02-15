Rails.application.routes.draw do
  root 'static_pages#top'
  get 'about', to: 'static_pages#about'
  post 'callback', to: 'linebots#callback'

  get 'login', to: 'user_sessions#new'
  post 'guest_login', to: 'user_sessions#guest_login'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create]
  resources :memos
end
