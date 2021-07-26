class CommentsController < ApplicationController
  # def index
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(parent_id: params[parent_id])
  # end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[parent_id])
  end

  

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to request.referrer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user)
  end
end
