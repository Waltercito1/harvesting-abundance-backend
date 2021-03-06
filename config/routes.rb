Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000"
  get 'current_user/index'
  get '/current_user', to: 'current_user#index'

  resources :reviews
  resources :harvest_sites
  resources :locations
  resources :trees

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
