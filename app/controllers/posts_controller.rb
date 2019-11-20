class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.order("created_at DESC").group_by{|e| e.created_at.strftime('%Y/%m/%d') }
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
        flash[:notice] = "投稿しました"
        redirect_to root_path
    else
        flash[:error] = "投稿に失敗しました"
        render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :picture, 
      :text
    )
  end
end
