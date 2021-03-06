Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    # いいね機能
    resource :favorites, only: [:create, :destroy]
    # コメント機能
    resources :book_comments, only: [:create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get 'searches/search', as: 'search'
  
  resources :chats, only: [:create]
  get 'chat/:id' => 'chats#show', as: 'chat'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

