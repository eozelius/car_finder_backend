Rails.application.routes.draw do
  resources :cars
  root 'home#index'
  post 'car-finder', to: 'cars#car_finder_chatbot'
end
