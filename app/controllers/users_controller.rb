class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def feed
    @user = current_user
    @post = Post.new
    @posts = @posts = Post.all.order(updated_at: :desc)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
