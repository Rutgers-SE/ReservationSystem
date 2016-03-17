Rails.application.routes.draw do
  resources :reservations
  devise_for :owners, controllers: {
    registrations: 'owners/registrations'
  }
  devise_for :admins, controllers: {
    registrations: 'admins/registrations'
  }
  devise_for :customers
  get 'home/index'

  resources :payments


  root 'home#index'
end
