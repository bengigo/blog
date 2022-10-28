require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Bengi', Photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', Bio: 'This is my bio', PostsCounter: '6') }

  before { subject.save }

  it 'name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.Name = 'Bengi'
    expect(subject).to be_valid
  end

  it 'posts counter should be greater than 0' do
    subject.PostsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'posts counter should be equal to 0' do
    subject.PostsCounter = 0
    expect(subject).to be_valid
  end

  it 'should list three recent posts' do
    4.times do |i|
      Post.create(Title: 'Hello', Text: "Post number #{i}", CommentsCounter: 0, LikesCounter: 0, author: subject)
    end

    expect(subject.latest_three_posts[0].Text).to eq 'Post number 3'
    expect(subject.latest_three_posts.length).to eq 3
  end
end
