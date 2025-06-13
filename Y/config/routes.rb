Rails.application.routes.draw do
  devise_for :users


  authenticated :user do
    root to: 'chats#index', as: :authenticated_root
  end


  unauthenticated do
    root to: redirect('/users/sign_in'), as: :unauthenticated_root
  end

  resources :users, only: %i[index show new create edit update]

  resources :chats, only: %i[index new create] do
    resources :messages, only: %i[index new create edit update destroy]
  end
end


