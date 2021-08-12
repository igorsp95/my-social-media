class UsersController < ApplicationController

  def feed
    @user = current_user
    @post = Post.new
    @posts = Post.includes(:user).order(updated_at: :desc)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.order(created_at: :desc)
  end
end
