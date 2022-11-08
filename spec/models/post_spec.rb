require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.new(name: 'Bengi', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'This is my bio', posts_counter: '6')
    Post.create(title: 'Hello', text: 'Post text', comments_counter: '0', likes_counter: '0', author: user)
    Post.create(title: 'Hello', text: 'Post text', comments_counter: '0', likes_counter: '0', author: user)
  end
  before { subject.save }

  it 'title should be present' do
    subject.title = 'Hello'
    expect(subject).to be_valid
  end

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title shoud be maximum 250 character' do
    subject.title = 'Very long title' * 50
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater than 0' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'comments counter should be equal to 0' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'likes counter should be greater than 0' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'likes counter should be equal to 0' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'should update post counter' do
    expect(subject.update_post_counter).to eq true
    expect(subject.author.posts_counter).to eq 2
  end

  it 'should list last five comments' do
    6.times do |i|
      Comment.create(text: "test comment #{i}", post: subject, author: subject.author)
    end

    expect(subject.latest_five_comments.last.text).to eq 'test comment 1'
    expect(subject.latest_five_comments.length).to eq 5
  end
end
