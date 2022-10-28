require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.new(Name: 'Bengi', Photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', Bio: 'This is my bio', PostsCounter: '6')
    Post.create(Title: 'Hello', Text: 'Post text', CommentsCounter: '0', LikesCounter: '0', author: user)
    Post.create(Title: 'Hello', Text: 'Post text', CommentsCounter: '0', LikesCounter: '0', author: user)
  end
  before { subject.save }

  it 'title should be present' do
    subject.Title = 'Hello'
    expect(subject).to be_valid
  end

  it 'title should be present' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'title shoud be maximum 250 character' do
    subject.Title = 'Very long title' * 50
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater than 0' do
    subject.CommentsCounter = -5
    expect(subject).to_not be_valid
  end

  it 'comments counter should be equal to 0' do
    subject.CommentsCounter = 0
    expect(subject).to be_valid
  end

  it 'likes counter should be greater than 0' do
    subject.LikesCounter = -5
    expect(subject).to_not be_valid
  end

  it 'likes counter should be equal to 0' do
    subject.LikesCounter = 0
    expect(subject).to be_valid
  end

  it 'should update post counter' do
    expect(subject.update_post_counter).to eq true
    expect(subject.author.PostsCounter).to eq 2
  end

  it 'should list last five comments' do
    6.times do |i|
      Comment.create(Text: "test comment #{i}", post: subject, author: subject.author)
    end

    expect(subject.latest_five_comments.last.Text).to eq 'test comment 1'
    expect(subject.latest_five_comments.length).to eq 5
  end
end
