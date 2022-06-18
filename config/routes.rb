Rails.application.routes.draw do
  get 'bookings/new'
  get '/flights', to: 'flights#index'

  root 'flights#index'
end
