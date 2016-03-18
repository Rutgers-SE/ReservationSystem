Rails.application.routes.draw do
  devise_for :owners, controllers: {
    registrations: 'owners/registrations'
  }
  devise_for :admins, controllers: {
    registrations: 'admins/registrations'
  }
  devise_for :customers
  get 'home/index'

  resources :payments
  resources :prices

  get '/price/assign' => 'prices#assign_price', as: :assign_price

  root 'home#index'
end
