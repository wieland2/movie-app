Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show] do
    resources :friendships, only: [:index, :new, :create]
  end

  resources :movies, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create]
  resources :bookmarks, only: [:new, :create]
  end

  resources :posts, only: [:index, :new, :create] do
    resources :comments, only: [:index, :new, :create] do
    end
  end


    resources :likes, only: [:new, :create]



  resources :lists do
  resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]
  resources :posts, only: [:destroy]
  resources :comments, only: [:destroy]
  resources :friendships, only: [:destroy]
  resources :likes, only: [:destroy]
end
