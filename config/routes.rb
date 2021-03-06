Rails.application.routes.draw do
  
  defaults format: :json do 
    # Signup
    post '/signup' => 'users#create'

    # Logins
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
    
    # Users
    resources :users, only: [:index, :show, :create] do 
      resources :stories, only: [:index]
      resources :characters, only: [:index]
      get 'recently_created_stories' => "stories#recently_created"
      get 'recently_created_characters' => "characters#recently_created"

    end 

    # Stories
    resources :stories, only: [:index, :show, :create, :update, :destroy] do
      resources :characters, only: [:index, :create]
      resources :comments, only: [:index, :create]
    end
    
    get '/recently_created_stories' => 'stories#recently_created'
    
    # Characters
    resources :characters, only: [:index, :show, :create, :update, :destroy] do
      resources :comments, only: [:index, :create]
    end 

    get '/recently_created_characters' => 'characters#recently_created'
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
