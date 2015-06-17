  class PostsController < ApplicationController
    #before_action :require_authenticated_user, :except => [:index, :show]
    before_action :set_post, :only => [:show, :edit, :update, :destroy]
    
    def index
     @posts = Post.all.order('created_at DESC').first(3)
   end

   def new
     @post = Post.new
     @post = current_user.posts.new
   end

   def show
     @posts = Post.all
     @comment = Comment.new
   end

   def create
     @post = Post.create(post_params)

     if @post.save
       redirect_to @post
     else
       render 'new'
     end
   end

   def edit
   end

   def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :all_tags, :pic)
  end
end