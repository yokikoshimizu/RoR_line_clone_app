# Railsのルーティングファイルの基本構文
# Rails.draw do…end の中にURLの設定を書くとRailsが「どのURLで土の処理をするのか」を判断できる
Rails.application.routes.draw do
  get "message/index"
  get "message/create"
  get "users/index"
  get "friendships/create"
  get "friendships/destroy"
  get "home/index"
  get "home/top"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # authenticated : 「認証済み（ログイン中）」の条件を設定するRailsの構文
  # :User 認証対象のモデルで、Deviseを使っているのでここではUserモデルのこと
  # root to: "home#index"　トップページにアクセスしたら、 home_controller.rb の index アクションを実行する
  # as: :authenticated_root	このルーティングに authenticated_root_path という名前を付ける（link_to などで使えるようにする）
  authenticated :user do
    root to: "home#index", as: authenticated_root
  end

  unauthenticated do
    root to: "home#top", as: unauthenticated_root
  end

  resources :friendships, only: [ :index, :create, :destroy ]
  resources :users, only: [ :index ]
end
