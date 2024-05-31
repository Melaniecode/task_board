# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks

  # Defines the root path route ("/")
  root 'tasks#index'
end
