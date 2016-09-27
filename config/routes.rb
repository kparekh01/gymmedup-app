Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: 'confirmations' }
  as :user do
    get 'users', :to => 'users#index', :as => :user_root
  end

  namespace :api do
    namespace :v1 do
      post '/gyms' => 'gyms#create'
    end
  end

  root  "users#welcome"

  get '/users/show' => 'users#show'
  patch 'users/:id' => 'users#update'

  get '/gyms' => 'gyms#index'

  get 'rooms/:id' => 'rooms#show'

  get '/conversations/new' => 'conversations#new'
  post '/conversations' => 'conversations#create'

  mount ActionCable.server => '/cable'

end
