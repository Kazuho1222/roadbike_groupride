Rails.application.routes.draw do
  get '/mypage' => 'users#mypage'
  devise_for :users
  root to: "events#index"
  resources :users, only: [:show]
  resources :events do
    member do
      post 'entry'
    end
  end
end
