Rails.application.routes.draw do

  get 'dashboard/profit'
  get 'dashboard/switch', as: :dashboard

  resources :reservations

  get '/reservation/:id/validate' => 'reservations#validate', as: :validate_reservation
  get '/reservation/:id/qr' => 'reservations#qr_code', as: :qr_reservation
  get '/payment/refund' => 'payments#refund', as: :refund_payment

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

  get '/api/garage/full' => 'garage#full'
  get '/api/garage/reserve' => 'garage#reserve'

  get '/owner' => 'dashboard#switch'

  root 'home#index'
end
