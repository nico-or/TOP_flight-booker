Rails.application.routes.draw do
  resources :bookings, only: %i[new create]
  get '/flights', to: 'flights#index'

  root 'flights#index'
end
