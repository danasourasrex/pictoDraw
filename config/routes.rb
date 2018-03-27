Rails.application.routes.draw do
  root 'pages#home'
  get '/login',		to: 'sessions#new'

  post '/login',	to:'sessions#create'

  get '/logout',	to: 'sessions#destroy'
  #delete '/logout' => :destroy
  get '/home',		to: 'pages#home'
  get '/about',		to: 'pages#about'
  get '/landing', 	to: 'pages#landingPage'
  #get 'pages/home'

  #get 'pages/about'

  post '/signup', to: 'users#create'
  get '/signup', 	to: 'users#new'
  get '/users/:id', to: 'sessions#create'

  #General catch all
  match ':controller(/:action(/:id))',  :via => :get

  resources :users
end
