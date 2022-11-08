require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.new(name: 'Bengi', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'This is my bio', posts_counter: '6')
    p = Post.create(title: 'Test title', text: 'Test text text', comments_counter: '0', likes_counter: '0', author: user)
    Comment.create(text: 'First comment', author: user, post: p)
    Comment.create(text: 'Second comment', author: user, post: p)
  end

  it 'should update comments counter' do
    expect(subject.update_comments_counter).to eq true
    expect(subject.post.comments_counter).to eq 2
  end
end
