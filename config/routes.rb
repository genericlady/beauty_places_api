Rails.application.routes.draw do
  get '/deals', to: 'deals#index'
  get '/search', to: 'beauty_places#index'
  get '/details', to: 'beauty_places#details'
  get '/current_location', to: 'current_location#show'
  post '/login', to: 'sessions#login'
  post '/signup', to: 'users#signup'
end
