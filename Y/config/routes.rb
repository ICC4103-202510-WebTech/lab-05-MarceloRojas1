# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root "messages#index"

  resources :users, only: %i[index show new create edit update]

  resources :chats,   only: %i[index show new create]

  resources :messages, only: %i[index show new create edit update destroy]

end


