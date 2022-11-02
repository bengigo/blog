require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'is a success' do
      get('/users/1/posts')
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end

    it 'renders the posts as list' do
      get '/users/1/posts'
      expect(response.body).to include('Here is every posts of User ...')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    it 'is a success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end

    it 'renders a specific post from a user' do
      get '/users/1/posts/1'
      expect(response.body).to include('Here is post ... of User ...')
    end
  end
end
