class CommentsController < ApplicationController

  def create
    @comment = Comment.create(text: comment_params[:text], post_id: comment_params[:post_id])
    flash[:notice] = "コメントしました"
    redirect_to post_path(params[:post_id]) 
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
end
