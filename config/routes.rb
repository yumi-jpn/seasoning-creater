Rails.application.routes.draw do
  devise_for :users
  root to: "tastes#index"
   resources :tastes, only:[:index, :new, :create, :show]
end
