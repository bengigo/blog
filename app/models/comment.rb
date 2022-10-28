class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_comments_counter
    post.update(CommentsCounter: post.comments.count)
  end
end
