Rails.application.routes.draw do

  devise_for :users
  get 'my_polls', to: 'polls#user_polls'
  root :to => 'polls#index'
  resources :polls do
    resources :items
  end
  resources :votes, only: [:create]
end
