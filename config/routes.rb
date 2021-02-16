Rails.application.routes.draw do
  devise_for :users
  root to: "tastes#index"
  get '/genre/:id', to: "tastes#genre"
  resources :tastes do
   resources :comments, only: :create
  end
end
