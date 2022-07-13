Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :teacher, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  #会員側のルーティング設定

  scope module: :public do
    resources :users,only: [:show, :edit, :update]
    resources :contact_books, only: [:index, :show]
    root to: "homes#top"
    get '/home/about' => 'homes#about', as: 'about'
    resources :chats, only: [:create]
    resources :rooms, only: [:create, :show]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  #管理者側のルーティング設定
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      resources :contact_books, except: [:destroy]
    end
    resources :chats, only: [:create]
    resources :rooms, only: [:create, :show]
  end
end