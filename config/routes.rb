Rails.application.routes.draw do
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
    Rails.application.routes.draw do
  resources :games
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    end

   post '/user/update_op_url' => 'user#update_op_url'
   post '/games/add_opp' => 'games#add_opp'
end
