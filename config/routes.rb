Rails.application.routes.draw do
  devise_for :adms
  resources :reservas
  resources :hospedes
  get 'home/index'
  resources :hotels

  root to: 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
