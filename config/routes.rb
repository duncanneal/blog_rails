Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "registrations"
      }

  resources :posts, :only => [:create, :show] 
  resources :comments, :only => [:create, :edit, :destroy]
  resource :session, :only => [:create, :destroy]
  
  #get 'comments/index'

  get 'posts/index'
  get 'blog/:id' => 'home#show', as: :blog
  root 'home#index'

  
end