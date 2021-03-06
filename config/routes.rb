Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "registrations",
    :omniauth_callbacks => "callbacks"
  } 

  resources :charges, :only => [:new, :create]

  resources :posts do
    resources :comments, :only => [:create, :destroy]
  end

  root 'home#index'  
end
