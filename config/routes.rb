Rails.application.routes.draw do
  root 'page#index'

  get 'page/trip'
  get 'page/trip_summary'

  resources :drive_data
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
