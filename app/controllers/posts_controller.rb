  class PostsController < ApplicationController
    before_action :require_authenticated_user, :except => [:index, :show]

    def index
      if params[:mine]
       @posts = current_user.try(:posts)
     end
      @posts = Post.all.order('created_at DESC') #current.rakeduser
    end

    def new
     @post = Post.new
     @post = current_user.posts.new
   end

   def show
     @post = Post.find(params[:id])
     @comment = @post.comments.build
   end

   def create
     @post = current_user.posts.new(post_params)

     if @post.save
       redirect_to @post
     else
       render 'new'
     end
   end

   def edit
     @post = Post.find(params[:id])
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

  def post_params
    params.require(:post).permit(:user_id, :title, :date, :author, :body, :all_tags)
  end
end