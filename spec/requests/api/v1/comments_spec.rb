require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::V1::CommentsController', type: :request do
  # swagger annotations
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    get 'Fetch all comments for a post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer, required: true, description: 'ID of the user who authored the post'
      parameter name: :post_id, in: :path, type: :integer, required: true, description: 'ID of the post for which comments are to be fetched'

      response '200', 'returns all comments for the given post' do
        let(:user) { create(:user) }
        let(:user_id) { user.id }
        let(:post) { create(:post, author: user) }
        let(:post_id) { post.id }
        let!(:comments) { create_list(:comment, 5, post: post, author: user) }

        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              text: { type: :string },
              author_id: { type: :integer },
              post_id: { type: :integer }
            },
            required: [ 'id', 'text', 'author_id', 'post_id' ]
          }

        run_test!
      end
    end
  end
end

RSpec.describe 'Api::V1::CommentsController', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, author: @user)
      @comment_params = { text: 'A new comment' }
    end
    
    it 'returns a 200 response to add comment' do
      post "/api/v1/users/#{@user.id}/posts/#{@post.id}/comments", 
        params: @comment_params.to_json,
        headers: { 'Content-Type': 'application/json' }
      
      expect(response.status).to eq(200)
    end
  end
end


