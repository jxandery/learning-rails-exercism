Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'

  root 'welcome#index'
end
