Rails.application.routes.draw do
  resources :users, only:[:new, :create]
  resources :sessions, only:[:new, :create, :destroy]
  resources :static_pages, only:[:root]
  resources :chats, only:[:index, :create, :show] do
    resources :messages, only: [:create]
  end

  root to: 'users#new'
end
