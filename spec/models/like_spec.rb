require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.new(name: 'Bengi', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'This is my bio', posts_counter: '6')
    p = Post.create(title: 'Test title', text: 'Test text text', comments_counter: '0', likes_counter: '0', author: user)
    Like.create(author: user, post: p)
    Like.create(author: user, post: p)
  end

  it 'should update likes counter' do
    expect(subject.update_likes_counter).to eq true
    expect(subject.post.likes_counter).to eq 2
  end
end
