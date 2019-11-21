Rails.application.routes.draw do
  resources :things
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
    Rails.application.routes.draw do
  resources :things
  resources :games
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    end

   post '/user/update_op_url' => 'user#update_op_url'
   post '/user/get_op_url' => 'user#get_op_url'
   post '/games/add_opp' => 'games#add_opp'
   post '/make_drawer' => 'games#make_drawer'
   get '/guesser' => 'games#guesser'
   post 'start' => 'games#start'
   get '/drawer' => 'games#drawer'
   get '/your-game' =>'games#your_game'
   post '/games/guess' => 'games#guess'
   post '/check' => 'games#check'
   get 'games/:id/review' => 'games#review'
end
