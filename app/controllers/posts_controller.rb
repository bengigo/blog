class PostsController < ApplicationController
  def index
    # @user = User.find(params[:id])
    @user = User.includes(:posts, :comments).find(params[:id])
    @user_posts = @user.posts.includes(:comments)
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:post][:title], text: params[:post][:text], author_id: current_user.id)
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"

    else
      render :new
    end
  end
end
