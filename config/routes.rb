Rails.application.routes.draw do
  resources :sessions
  resources :moves
  resources :pokeballs
  resources :pokemons
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get    '/login',   to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

end
