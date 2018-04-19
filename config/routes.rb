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
  get '/users/show/id'
  #get 'pages/about'

  get '/chatAC', to: 'rooms#show'
  post '/chatAC', to: 'room_channel#speak'
  post "/updateline", to: "rooms#draw"
  post "/updateTime", to:"rooms#time"
  post "/clear", to: "rooms#clear"

  #messages
  delete '/delAll', to: 'messages#delAll'

  #Word Creation
  get '/addWord', to: 'pages#wordData'
  get '/wordDataCreate', to: 'pages#wordDataCreate'

  

  #General catch all
  match ':controller(/:action(/:id))',  :via => :get

  resources :users

  mount ActionCable.server => '/cable'
end