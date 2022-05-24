Rails.application.routes.draw do
  get '/flights', to: 'flights#index'

  root 'flights#index'
end
