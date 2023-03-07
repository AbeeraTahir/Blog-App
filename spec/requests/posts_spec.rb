require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  subject do
    @user = User.create(name: 'Rose', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Doctor', posts_counter: 1)
    @post = Post.create(title: 'AI', text: 'Great post', comments_counter: 1, likes_counter: 1, author: @user)
  end
  before { subject.save }
  describe 'GET #index' do
    before(:example) { get user_posts_path(user_id: @user.id) }

    it 'returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include(@post.text)
    end
  end

  describe 'GET #show' do
    before(:example) { get user_post_path(user_id: @user.id, id: @post.id) }

    it 'returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include(@post.text)
    end
  end
end
