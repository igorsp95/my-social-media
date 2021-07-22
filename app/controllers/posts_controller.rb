class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order(updated_at: :desc)
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
    params.require(:post).permit(:content, :user)
  end

end
