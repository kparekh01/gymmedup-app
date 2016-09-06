Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  "users#welcome"
  get '/users/show/:id' => 'users#show'
  as :user do
    get 'users', :to => 'users#index', :as => :user_root
  end

end
