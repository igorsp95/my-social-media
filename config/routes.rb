Rails.application.routes.draw do
  devise_for :users
  root to: 'users#feed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show] do
    get :feed
  end

  resources :posts do
    member do
      patch "upvote", to: "posts#upvote"
      patch "downvote", to: "posts#downvote"
    end

    resources :comments, only: [:create, :destroy]
  end
end
