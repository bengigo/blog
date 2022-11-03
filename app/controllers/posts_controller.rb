class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @user_posts = @user.posts
    @comments = Comment.all
  end

  def show
    # @user = User.find(params[:id])
    # @user_posts = @user.posts
    # @post = @user_posts.find(params[:id])
    @post = Post.find(params[:id])
  end
end
