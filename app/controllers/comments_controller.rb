class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(id: params[:id], author_id: current_user.id, Text: params[:text])
    @comment.save
    redirect_to '#'
  end
end
