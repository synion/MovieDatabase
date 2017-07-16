Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :actors
  resources :movies
  resources :genres
  root 'actors#index'
end
