Rails.application.routes.draw do
  resources :harvest_sites
  resources :locations
  resources :trees
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
