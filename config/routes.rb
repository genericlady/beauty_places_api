Rails.application.routes.draw do
  get '/search', to: 'beauty_places#index'
  get '/current_location', to: 'current_location#show'
end
