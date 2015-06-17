Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "registrations"
  }

  resources :posts do
    resources :comments, :only => [:create, :destroy]
  end

  root 'home#index'  
end
