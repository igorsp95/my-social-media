class CommentsController < ApplicationController

  def upvote
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.post = @post
    if current_user.voted_up_on? @comment
      @comment.unvote_by current_user
    else
      @comment.upvote_by current_user
    end
    render "vote.js.erb"
  end

  def downvote
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.post = @post
    if current_user.voted_down_on? @comment
      @comment.unvote_by current_user
    else
      @comment.downvote_by current_user
    end
    render "vote.js.erb"
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      respond_to do |format|
        format.js {render inline: "location.reload();" }
      end
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user, :post_id)
  end
end
