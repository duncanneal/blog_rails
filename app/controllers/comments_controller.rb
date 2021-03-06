class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end 

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post }
        format.json { render json: { comment: render_to_string(@comment, formats: 'html') }}
      else
        format.html { redirect_to :back }
        format.json { render json: { error: "NOPE" } } # TODO actually do error here.
      end
    end
  end


  def destroy
    @comment.destroy
    respond_to do |format|
    format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  #def set_comment
   # @comment = Comment.find(params[:id])
  #end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:post_id, :title, :author_name, :author_email, :body)
  end
end