# frozen_string_literal: true

Rails.application.routes.draw do
  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'

  get '/log_in', to: 'sessions#new'
  post '/log_in', to: 'sessions#create'

  delete '/log_out', to: 'sessions#destroy'

  resources :tasks

  # Defines the root path route ("/")
  root 'tasks#index'
end
