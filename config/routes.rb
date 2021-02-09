Rails.application.routes.draw do
  root to: "tastes#index"
   resources :tastes, only:[:index]
end
