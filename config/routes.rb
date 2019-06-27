Rails.application.routes.draw do
  resources :cars
  root 'home#index'
  get 'car-finder', to: 'cars#carFinder'
end
