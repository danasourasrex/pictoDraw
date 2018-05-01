Rails.application.routes.draw do


  resources :messages
  resources :words
  resources :users
  #HOME
  root 'pages#home'

  #SIGNUP/LOGIN
  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  post '/users/new', to: 'users#create'
  
  get '/login',		to: 'sessions#new'
  post '/login',	to:'sessions#create'

  get '/logout',	to: 'sessions#destroy'

  get '/users/:id', to: 'sessions#new'
  post '/users/:id', to: 'sessions#create'

  #HOMEPAGE
  get '/home',		to: 'pages#home'
  get '/about',		to: 'pages#about'
  get '/landing', 	to: 'pages#landingPage'
  post '/landing', to: 'final_results#landing'



  #get 'pages/about'
  post '/destroyLobbyUser', to: 'pages#destroyLobbyUser'


  #GAME REQUESTS
  get '/play', to: 'rooms#show'
  post '/play', to: 'room_channel#speak'
  post "/updateline", to: "rooms#draw"
  post "/updateTime", to:"rooms#time"
  post "/clear", to: "rooms#clear"
  post "/leave", to: "rooms#leave"
  post '/updateWordToGuess', to: "rooms#updateWordToGuess"
  post '/finalResults', to: "rooms#finalResults"
  get 'rooms/show'
  
  #leaderboard
  get '/leaderboard', to: 'pages#leaderboard'

  #Admin
  get '/admin', to: "pages#admin"
  delete '/clearCurrent', to: 'final_results#deleteall'
  delete '/delAll', to: 'messages#delAll'
  get '/wordDataCreate', to: 'pages#wordDataCreate'
  
  #General catch all
  match ':controller(/:action(/:id))',  :via => :get

  mount ActionCable.server => '/cable'
end