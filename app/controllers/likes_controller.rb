# class LikesController < ApplicationController
#   def create
#     @like = Like.new(post_id: params[:post_id], author_id: current_user.id)
#     @like.save
#     @like.update_likes_counter
#   end
# end


class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new
    like.author = current_user
    like.post = post
    if like.save
      flash[:success] = 'Liked successfully'
    else
      flash[:error] = 'Error while trying to like'
    end
    redirect_to likes_new_path(current_user, post)
  end
end