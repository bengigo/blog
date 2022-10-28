require 'rails_helper'

  RSpec.describe Like, type: :model do
    subject do
      user = User.new(Name: 'Bengi', Photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', Bio: 'This is my bio', PostsCounter: '6')
      p = Post.create(Title: 'Test Title', Text: 'Test Text Text', CommentsCounter: '0', LikesCounter: '0', author: user)
      Like.create(author: user, post: p)
      Like.create(author: user, post: p)
    end
  
    it 'should update likes counter' do
      expect(subject.update_likes_counter).to eq true
      expect(subject.post.LikesCounter).to eq 2
    end
  end
