require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it "is a success" do
      get('/')
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      get('/')
      expect(response).to render_template('index')
    end

    it 'renders the users list' do
      get('/')
      expect(response.body).to include('Here is the list of every user')
    end
  end

  describe 'GET /users/:id' do
    it 'is a success' do
      get '/users/1'
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      get '/users/1'
      expect(response).to render_template('show')
    end
    it 'renders the Post text' do
      get '/users/1'
      expect(response.body).to include("User ...'s profile")
    end
  end
end
