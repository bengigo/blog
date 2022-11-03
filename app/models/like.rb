class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :LikesCounter, numericality: { allow_blank: true, greater_than_or_equal_to: 0 }

  def update_likes_counter
    post.update(LikesCounter: post.likes.count)
  end
end
