class PostsController < ApplicationController

 def index
   @posts = Post.all.order('created_at DESC') #current.rakeduser
 end

 def new
   @post = Post.new
 end

 def show
   @post = Post.find(params[:id])
   @comment = @post.comments.build
 end

 def create
   @post = Post.new(post_params)

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
   @post = Post.find(params[:id])

   respond_to do |format|
    if @post.update(post_params)
      format.html { redirect_to @post, notice: 'Post was successfully updated.' }
    else
      format.html { render :edit }
    end
  end
end

def destroy
  @post = Post.find(params[:id])

  @post.destroy
  respond_to do |format|
    format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private

def post_params
 params.require(:post).permit(:title, :date, :author, :body)
end
end
