Rails.application.routes.draw do
  root 'items#index'
  resources :itemms, only: :index
end
