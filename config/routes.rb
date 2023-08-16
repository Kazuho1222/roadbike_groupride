Rails.application.routes.draw do
  # get '/mypage' => 'users#mypage'
  devise_for :users
  root to: "events#index"
  # resource :profiles, only: [:show, :edit, :update]
  resources :users, only: [:show, :edit, :update]
  resources :events do
    member do
      post 'entry'
    end
  end
end
