require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET articles#index' do
    before(:each) do
      user = User.create email: 'tom@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get articles_path
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it "should render page contenting 'Articles'" do
      expect(response.body).to include('Articles')
    end
  end

  describe 'GET articles#new' do
    before(:each) do
      user = User.create email: 'tom@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get new_article_path
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:new)
    end

    it "should render page contenting 'Articles'" do
      expect(response.body).to include('New article')
    end
  end
end