class HomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").limit(3)
  end

  def show
    @post = Post.find(params[:id])
    #@comment = @post.comments.build
  end
end
