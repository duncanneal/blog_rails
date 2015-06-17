Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "registrations"
      }

  resources :posts do
    resources :comments, :only => [:create, :destroy]
  end
  resource :session, :only => [:create, :destroy]
  
  #get 'comments/index'
 
  root 'home#index'

  
end