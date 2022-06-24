Rails.application.routes.draw do
  resources :bookings, only: %i[show new create]
  get '/flights', to: 'flights#index'

  root 'flights#index'
end
