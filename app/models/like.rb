# class Like < ApplicationRecord
#   belongs_to :author, class_name: 'User'
#   belongs_to :post

#   after_save :update_likes_counter

#   def update_likes_counter
#     post.update(likes_counter: post.likes.count)
#   end
# end

class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :author, class_name: 'User'

  after_save :update_like_counter

  def update_like_counter
    post.increment!(:likes_counter)
  end
end