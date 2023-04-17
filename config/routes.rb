Rails.application.routes.draw do
  root "banks#index"
  resources :providers
  resources :banks
end
