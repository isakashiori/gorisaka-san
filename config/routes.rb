Rails.application.routes.draw do
  root 'static_pages#top'
  get 'about', to: 'static_pages#about'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create]
  resources :memos
end
