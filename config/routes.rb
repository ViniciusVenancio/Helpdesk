Aszist::Application.routes.draw do

  get "amendments/new/:contract_id", to: "amendments#new", as: :new_amendment 
  get "amendments/edit/:id/:contract_id", to: "amendments#edit", as: :other_edit_amendment

  resources :amendments

  resources :services

  resources :contract_types

  resources :contracts

  resources :enterprises

  devise_for :users

  resources :tickets do
    resources :comments
  end

  resources :users, except: [ :show ] do
    collection do
      post 'manage'
    end
  end

  get "/profile", to: "profiles#edit", as: :edit_profile
  patch "/profile", to: "profiles#update"

  root :to => 'tickets#index'

end