Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root  "users#welcome"
  get '/users/show' => 'users#show'
  patch 'users/:id' => 'users#update'
  as :user do
    get 'users', :to => 'users#index', :as => :user_root
  end

  get '/gyms' => 'gyms#index'

  namespace :api do
    namespace :v1 do
      post '/gyms' => 'gyms#create'
    end
  end

  get 'rooms/:id' => 'rooms#show'

  get '/conversations/new' => 'conversations#new'
  post '/conversations' => 'conversations#create'

  mount ActionCable.server => '/cable'

end
