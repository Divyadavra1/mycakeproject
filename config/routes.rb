# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products
  resources :carts

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    devise_for :users, controllers: { sessions: 'users/sessions' }
  end
 
  patch '/:id', to: 'carts#update'
  get '/sort', to: 'products#sort', as: 'sort'
  get '/filter', to: 'products#filter', as: 'filter'
  get 'search', to: 'products#search'
  delete 'destroy/:id', to: 'carts#destroy', as: 'destroy'
  get 'home/index'
  get 'about' => 'home#about'
  get 'shopdetails' => 'home#shopdetails'
  get 'checkout' => 'home#checkout'
  get 'contact' => 'home#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'home#index'
end
