class CommentsController < ApplicationController
  # def index
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(parent_id: params[parent_id])
  # end

  # def new
  #   @post = Post.find(params[:post_id])
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to request.referrer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user, :post_id)
  end
end
