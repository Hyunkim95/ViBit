Rails.application.routes.draw do
  root 'page#index'

  get 'page/trip_progress'
  get 'page/trip_summary'
  get 'page/traffic_light'
  get 'page/progress'
  get 'page/rewards'

  resources :drive_data
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
