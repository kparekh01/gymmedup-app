Rails.application.routes.draw do
  get 'rooms/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  "users#welcome"
  get '/users/show' => 'users#show'
  as :user do
    get 'users', :to => 'users#index', :as => :user_root
  end

  get '/gyms' => 'gyms#index'

  namespace :api do
    namespace :v1 do
      post '/gyms' => 'gyms#create'
    end
  end

end
