require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Bengi', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'This is my bio', posts_counter: '6') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = 'Bengi'
    expect(subject).to be_valid
  end

  it 'posts counter should be greater than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts counter should be equal to 0' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'should list three recent posts' do
    4.times do |i|
      Post.create(title: 'Hello', text: "Post number #{i}", comments_counter: 0, likes_counter: 0, author: subject)
    end

    expect(subject.latest_three_posts[0].text).to eq 'Post number 3'
    expect(subject.latest_three_posts.length).to eq 3
  end
end
