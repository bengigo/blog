class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :Title, presence: true
  validates :Title, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { allow_blank: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { allow_blank: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    author.update(PostsCounter: author.posts.count)
  end

  def latest_five_comments
    comments.includes(:post).order(created_at: :desc).limit(5)
  end
end
