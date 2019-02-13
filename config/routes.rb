Rails.application.routes.draw do
  get 'attendances/index'
  get 'attendances/new'
  get 'attendances/create'
  get 'attendances/show'
  get 'attendances/edit'
  get 'attendances/update'
  get 'attendances/destroy'
  root 'events#index'

  devise_for :users
  resources :events
  resources :users
  resources :attendances
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
