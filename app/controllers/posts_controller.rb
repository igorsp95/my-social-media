class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order(updated_at: :desc)
    @comment = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_up_on? @post
      @post.unvote_by current_user
    else
      @post.upvote_by current_user
    end
    render "vote.js.erb"
  end

  def downvote
    @post = Post.find(params[:id])
    if current_user.voted_down_on? @post
      @post.unvote_by current_user
    else
      @post.downvote_by current_user
    end
    render "vote.js.erb"
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to request.referrer
      # redirect_to feed_users_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user, photos: [])
  end

end
