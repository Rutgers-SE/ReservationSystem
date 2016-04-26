Rails.application.routes.draw do

  get 'dashboard/profit'
  get 'dashboard/switch', as: :dashboard

  resources :reservations

  get '/reservation/:id/validate' => 'reservations#validate', as: :validate_reservation
  get '/reservation/:id/qr' => 'reservations#qr_code', as: :qr_reservation
  get '/reservation/:id/refund' => 'reservations#destroy', as: :refund_reservation
  get '/api/valid_qr' => 'reservations#valid_qr', as: :valid_qr

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
