Rails.application.routes.draw do
  get 'rooms/show'

  #get 'chat_test/chatroom'

  #get 'drawing_test/draw'

  resources :messages
  resources :words
  root 'pages#home'
  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',		to: 'sessions#new'

  post '/login',	to:'sessions#create'

  get '/logout',	to: 'sessions#destroy'
  #delete '/logout' => :destroy
  get '/home',		to: 'pages#home'
  get '/about',		to: 'pages#about'
  get '/landing', 	to: 'pages#landingPage'
  #get 'pages/home'
  get '/users/:id', to: 'sessions#new'
  post '/users/:id', to: 'sessions#create'
  #get 'pages/about'
  post '/destroyLobbyUser', to: 'pages#destroyLobbyUser'

  get '/chatAC', to: 'rooms#show'
  post '/chatAC', to: 'room_channel#speak'
  post "/updateline", to: "rooms#draw"
  post "/updateTime", to:"rooms#time"
  post "/clear", to: "rooms#clear"
  post "/leave", to: "rooms#leave"
  post '/updateWordToGuess', to: "rooms#updateWordToGuess"
  post '/finalResults', to: "rooms#finalResults"
  
  #Admin
  get '/admin', to: "pages#admin"

  delete '/clearCurrent', to: 'final_results#deleteall'

  #messages
  delete '/delAll', to: 'messages#delAll'

  #Word Creation
  get '/addWord', to: 'pages#wordData'
  get '/wordDataCreate', to: 'pages#wordDataCreate'

  #leaderboard
  get '/leaderboard', to: 'pages#leaderboard'
  

  #General catch all
  match ':controller(/:action(/:id))',  :via => :get

  resources :users

  mount ActionCable.server => '/cable'
end