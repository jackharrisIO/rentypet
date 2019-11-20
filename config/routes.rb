Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # get "pets/:id", to: "pets#index_user", as: 'user_pets'
  # get "pets/index"


  resources :users do
    resources :pets
  end

  resources :pets do
    resources :bookings
  end

  resources :bookings do
    resources :reviews
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
