class CommentsController < ApplicationController

 def index
   @comments = Comment.all
 end

 def new
   @comment = Comment.new
 end

 def create
   @comment = Comment.new(list_params)

   respond_to do |format|
     if @comment.save
       format.html { redirect_to root_path, notice: 'Your list was successfully created.' }
     else
       format.html { render :new }
     end
   end
 end

private

 def set_comment
    @comment = Comment.find(params[:id])
 end

   # Never trust parameters from the scary internet, only allow the white list through.
 def comment_params
   params.require(:comment).permit(:title, :body, :post_id, :date, :author)
 end

end