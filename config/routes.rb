# frozen_string_literal: true

Rails.application.routes.draw do
  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'

  get '/log_in', to: 'sessions#new'
  post '/log_in', to: 'sessions#create'

  delete '/log_out', to: 'sessions#destroy'

  resources :tasks

  namespace :admin do
    resources :users
  end

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable_entity', via: :all
  match '/500', to: 'errors#server_error', via: :all
  match '*path', to: 'errors#not_found', via: :all

  # Defines the root path route ("/")
  root 'tasks#index'
end
