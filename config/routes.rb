Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "registrations"
      }

  resources :posts, :only => [:create, :show, :edit] do
    resources :comments, :only => [:create, :edit, :destroy]
  end
  resource :session, :only => [:create, :destroy]
  
  #get 'comments/index'

  get 'posts/index'
  get 'blog/:id' => 'home#show', as: :blog
  post '/users' => 'users#create'
  root 'home#index'

  
end