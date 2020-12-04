Rails.application.routes.draw do
  
  root 'tweets#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :tweets
  resources :follows
  

  resources :users do

    get 'profile'
    
  end

  post '/users/:user_id/follow', to: "follows#following", as: "follow_user"
  post '/users/:user_id/unfollow', to: "follows#unfollow", as: "unfollow_user"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
