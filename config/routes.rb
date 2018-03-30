Rails.application.routes.draw do
  #get 'chat_test/chatroom'

  #get 'drawing_test/draw'

  resources :messages
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



  #CHAT TEST
  get '/chatroom', to: 'chat_test#chatroom'

  get '/AJAXTEST', to: 'chat_test#chatbox'

  #Drawing Test
  get '/drawtest', to: 'drawing_test#draw'
  
  
  get '/users/:id', to: 'sessions#create'

  #General catch all
  match ':controller(/:action(/:id))',  :via => :get

  resources :users
end