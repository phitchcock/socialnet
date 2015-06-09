Rails.application.routes.draw do
  root "pages#home"
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friendships, only: [:create, :destroy, :update, :accept] do
    member do 
      put :accept
    end
  end
  resources :activities, only: [:index]
end
