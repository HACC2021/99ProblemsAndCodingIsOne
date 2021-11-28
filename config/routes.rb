Rails.application.routes.draw do
  resources :pets, :home
  get 'home/bullshit'
  get 'petsindex' => 'pets#show'
  devise_for :users
  
  unauthenticated :user do
  root :to => 'home#index', :as => "unauthenticated_root"
  end
  
  authenticated :user do
    root :to => "pets#index"
    # Rails 4 requires the 'as' option to give it a unique name
    root :to => "pets#index", :as => "authenticated_root"
  end

end
