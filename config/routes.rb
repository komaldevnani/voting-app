Rails.application.routes.draw do

  devise_for :users

  root :to => 'polls#index'
  resources :polls do
    resources :items
  end
end
