Rails.application.routes.draw do
  post '/show' => 'forecasts#show'
  get '/show' => 'forecasts#show'
  root 'forecasts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
