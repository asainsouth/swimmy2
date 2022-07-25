Rails.application.routes.draw do

  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  # URL /teacher/sign_in ...
  devise_for :teacher, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  #ゲストログイン設定
    devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    end

  #会員側のルーティング設定

  scope module: :public do
    resources :users,only: [:show, :edit, :update] do
      resources :contact_books, only: [:index, :show]
    end

    root to: "homes#top"
    get '/home/about' => 'homes#about', as: 'about'
    resources :rooms, only: [:create, :index, :show]
    resource :chats, only: [:create]
    resources :notifications, only: :index
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  #管理者側のルーティング設定
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
    resources :contact_books, except: [:destroy]
    end
    resources :rooms, only: [:create, :show]
    resource :chats, only: [:create]
  end
end