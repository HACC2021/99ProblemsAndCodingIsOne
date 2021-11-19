Rails.application.routes.draw do
  resources :pets, :home
  get 'home/bullshit'
  get 'petsindex' => 'pets#show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  #get 'home/petStatusCheck', to: 'petStatusCheck_Controller#show'
end
