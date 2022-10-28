require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.new(Name: 'Bengi', Photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', Bio: 'This is my bio', PostsCounter: '6')
    p = Post.create(Title: 'Test Title', Text: 'Test Text Text', CommentsCounter: '0', LikesCounter: '0', author: user)
    Comment.create(Text: 'First comment', author: user, post: p)
    Comment.create(Text: 'Second comment', author: user, post: p)
  end

  it 'should update comments counter' do
    expect(subject.update_comments_counter).to eq true
    expect(subject.post.CommentsCounter).to eq 2
  end
end