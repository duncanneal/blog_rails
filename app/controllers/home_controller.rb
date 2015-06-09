class HomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").limit(3) 
  end

end
