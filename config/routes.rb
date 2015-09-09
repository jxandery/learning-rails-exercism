Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'
  get '/auth/github', as: :login

  root 'welcome#index'
end
