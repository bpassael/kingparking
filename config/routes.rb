Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  resources :cars, only: [:index, :show] do
    resources :bookings, only: [:create, :destroy]
  end
end
