Rails.application.routes.draw do
  root 'page#connect'
  get 'page/index'
  get 'page/trip_progress'
  get 'page/trip_summary'
  get 'page/traffic_light'
  get 'page/sign_adherence'
  get 'page/speed'
  get 'page/progress'
  get 'page/rewards'
  get 'page/rewards_information'
  get 'page/carwash_voucher'
  get 'page/fuel_voucher'
  get 'page/board'
  get 'page/connect'
  get 'page/landing_page'

  resources :drive_data
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
