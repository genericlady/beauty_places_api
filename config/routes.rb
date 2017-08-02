Rails.application.routes.draw do
  get '/search', to: 'beauty_places#index'
  get '/details', to: 'beauty_places#details'
  get '/current_location', to: 'current_location#show'
end
