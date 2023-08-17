Rails.application.routes.draw do
  # get '/mypage' => 'users#mypage'
  devise_for :users
  root to: "events#index"
  # resource :profiles, only: [:show, :edit, :update]
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  resources :events do
    resources :comments, only: :create
    member do
      post 'entry'
    end
  end
end
