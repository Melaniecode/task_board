# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  post '/create_sample_tasks', to: 'tasks#create_sample_tasks'
  # Defines the root path route ("/")
  root 'tasks#index'
end
